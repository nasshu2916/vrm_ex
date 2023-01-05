defmodule Mix.Tasks.VrmEx.Schema do
  @moduledoc "generate constructor from json schema `mix vrm_ex.schema <path>`"
  @shortdoc "generate constructor from json schema"
  use Mix.Task

  require Logger

  @output_dir "lib/vrm_ex/schema/"
  @template_path "template/vrm_schema.eex"
  @line_length 120
  @module_prefix VrmEx.Schema

  @impl Mix.Task
  def run(args) do
    case args do
      [path] ->
        path
        |> load()
        |> write()

      _ ->
        IO.puts(@moduledoc)
    end
  end

  def schema_resolver(dirname, path) do
    Path.join(dirname, path)
    |> File.read!()
    |> Jason.decode!()
  end

  def load(path) do
    dirname = Path.dirname(path)

    Application.put_env(
      :ex_json_schema,
      :remote_schema_resolver,
      &schema_resolver(dirname, &1)
    )

    path
    |> File.read!()
    |> Jason.decode!()
    |> ExJsonSchema.Schema.resolve()
  end

  defp module_name(file_name) do
    module =
      file_name
      |> format_title()
      |> String.replace(" ", "")
      |> String.split(".")
      |> Enum.map_join(".", &Macro.camelize/1)

    Module.concat(@module_prefix, module)
  end

  def basename(file_name) do
    file_name
    |> format_title()
    |> String.replace(".", "/")
  end

  defp format_title(file_name) do
    String.replace(file_name, ".schema.json", "")
  end

  @spec write(ExJsonSchema.Schema.Root.t()) :: :ok
  def write(root) do
    title = Map.fetch!(root.schema, "title")
    %{schema: schema, refs: refs} = root
    content = generate(schema, refs)

    do_write(content, title)
  end

  @spec do_write([String.t()], String.t()) :: :ok
  def do_write(content, title) do
    path = @output_dir <> basename(title) <> ".ex"
    File.mkdir_p(Path.dirname(path))
    File.write!(path, content)
  end

  @spec generate(ExJsonSchema.Schema.resolved(), %{String.t() => ExJsonSchema.Schema.resolved()}) ::
          [String.t()]
  def generate(schema, refs) do
    @template_path
    |> EEx.eval_file(bindings(schema, refs))
    |> Code.format_string!(line_length: @line_length)
    |> Kernel.++(["\n"])
  end

  defp bindings(schema, refs) do
    module_name = Map.fetch!(schema, "title") |> module_name()
    properties = Map.fetch!(schema, "properties") |> properties(refs)

    [
      module_name: module_name,
      description: schema["description"],
      fields: properties_to_fields(properties),
      module_types: properties_to_types(properties)
    ]
  end

  def properties(properties, refs) do
    for {key, value} <- properties, into: %{} do
      key = key |> Macro.underscore() |> String.to_atom()
      {key, property(value, refs)}
    end
  end

  defp property(%{"type" => "array", "items" => property}, refs) do
    [property(property, refs)]
  end

  defp property(%{"$ref" => [definition]}, refs) do
    {ref_schame, refs} = Map.pop!(refs, definition)

    ref_schame
    |> generate(refs)
    |> do_write(definition)

    ref_schame
    |> Map.fetch!("title")
    |> module_name()
  end

  defp property(%{"type" => "object"} = schema, refs) do
    %{"properties" => properties} = schema

    Map.new(properties, fn {key, property} -> {key, property(property, refs)} end)
  end

  defp property(%{"type" => "number"}, _refs) do
    :number
  end

  defp property(%{"type" => "string"}, _refs) do
    :string
  end

  defp property(%{"type" => "integer"}, _refs) do
    :integer
  end

  defp property(%{"type" => "boolean"}, _refs) do
    :boolean
  end

  defp property(schema, _) do
    Logger.debug("not support schema property: #{inspect(schema)}")
    nil
  end

  def properties_to_fields(properties) do
    Enum.map_join(properties, ",\n", fn {key, value} -> "#{key}: #{module_to_string(value)}" end)
  end

  defp module_to_string([module]) do
    "[#{module_to_string(module)}]"
  end

  defp module_to_string(%{} = module) do
    fields =
      Enum.map_join(module, ", ", fn {key, value} -> "#{key}: #{module_to_string(value)}" end)

    "%{#{fields}}"
  end

  defp module_to_string(type) when type in [nil, :number, :string, :integer, :boolean] do
    "nil"
  end

  defp module_to_string(module_name) do
    "%#{module_name}{}"
  end

  def properties_to_types(properties) do
    Enum.map_join(properties, ",\n", fn {key, value} -> "#{key}: #{module_type(value)}" end)
  end

  defp module_type(types) when is_list(types) do
    Enum.map_join(types, ",", &module_type/1)
    |> then(&"[#{&1}]")
  end

  defp module_type(nil) do
    "nil"
  end

  defp module_type(:string) do
    "String.t()"
  end

  defp module_type(type) when type in [:number, :integer, :boolean] do
    "#{type}()"
  end

  defp module_type(%{}) do
    "map()"
  end

  defp module_type(module_name) do
    "#{module_name}.t()"
  end
end
