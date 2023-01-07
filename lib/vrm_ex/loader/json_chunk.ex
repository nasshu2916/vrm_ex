defmodule VrmEx.Loader.JsonChunk do
  defstruct [:length, :data]

  @chunk_type "JSON"

  @type t() :: %__MODULE__{
          length: integer(),
          data: %{String.t() => any()}
        }

  @spec load(binary()) :: {:ok, {t(), binary()}} | {:error, String.t()}
  def load(<<
        length::32-little-integer,
        @chunk_type::binary,
        data::size(length)-bytes,
        rest::bits
      >>) do
    case Jason.decode(data) do
      {:ok, data} -> {:ok, {%__MODULE__{length: length, data: data}, rest}}
      {:error, _} -> {:error, "invalid_json_chunk"}
    end
  end

  def load() do
    {:error, "invalid_json_chunk"}
  end
end
