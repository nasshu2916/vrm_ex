defmodule VrmEx do
  @moduledoc """
  Documentation for `VrmEx`.
  """
  alias VrmEx.{Meta, Loader}

  defstruct [:json_data, :binary]

  @type t() :: %__MODULE__{
          json_data: %{String.t() => any()},
          binary: binary()
        }
  @type image :: %{
          mime_type: String.t(),
          name: String.t(),
          data: binary()
        }

  @spec load(iodata()) :: {:ok, t()} | {:error, String.t()}
  def load(iodata) do
    iodata
    |> IO.iodata_to_binary()
    |> Loader.load()
  end

  @spec load!(iodata()) :: t()
  def load!(iodata) do
    case load(iodata) do
      {:ok, result} -> result
      {:error, reason} -> raise(reason)
    end
  end

  @spec thumbnail(t()) :: image()
  def thumbnail(vrm) do
    %{
      json_data: %{"images" => images, "bufferViews" => buffer_views},
      binary: binary
    } = vrm

    thumbnail_index = vrm |> Meta.meta() |> Meta.thumbnail_index()

    %{"mimeType" => mime_type, "name" => name, "bufferView" => index} =
      Enum.at(images, thumbnail_index)

    %{"byteOffset" => offset, "byteLength" => length} = Enum.at(buffer_views, index)

    <<_::size(offset)-bytes, image_data::size(length)-bytes, _::bits>> = binary
    %{mime_type: mime_type, name: name, data: image_data}
  end

  @spec images(t()) :: [image()]
  def images(vrm) do
    %{
      json_data: %{"images" => images, "bufferViews" => buffer_views},
      binary: binary
    } = vrm

    for image <- images do
      %{"bufferView" => index, "mimeType" => mime_type, "name" => name} = image

      %{"byteOffset" => offset, "byteLength" => length} = Enum.at(buffer_views, index)

      <<_::size(offset)-bytes, image_data::size(length)-bytes, _::bits>> = binary
      %{mime_type: mime_type, name: name, data: image_data}
    end
  end

  @spec write_image(image(), String.t()) :: :ok
  def write_image(image, base_dir \\ "") do
    %{mime_type: mime_type, name: name, data: image_data} = image
    extension = mime_type |> MIME.extensions() |> hd()
    path = Path.join(base_dir, "#{name}.#{extension}")
    File.write!(path, image_data)
  end
end
