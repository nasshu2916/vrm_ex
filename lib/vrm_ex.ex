defmodule VrmEx do
  @moduledoc """
  Documentation for `VrmEx`.
  """
  alias VrmEx.{Meta, Loader}

  defstruct [:header, :json_chunk, :binary_chunk]

  @type t() :: %__MODULE__{
          header: Loader.Header.t(),
          json_chunk: Loader.JsonChunk.t(),
          binary_chunk: Loader.BinaryChunk.t()
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
      json_chunk: %{
        data: %{"images" => images, "bufferViews" => buffer_views}
      },
      binary_chunk: %{data: binary_data}
    } = vrm

    thumbnail_index = vrm.json_chunk.data |> Meta.meta() |> Meta.thumbnail_index()

    %{"mimeType" => mime_type, "name" => name, "bufferView" => index} =
      Enum.at(images, thumbnail_index)

    %{"byteOffset" => offset, "byteLength" => length} = Enum.at(buffer_views, index)

    <<_::size(offset)-bytes, image_data::size(length)-bytes, _::bits>> = binary_data
    %{mime_type: mime_type, name: name, data: image_data}
  end

  @spec images(t()) :: [image()]
  def images(vrm) do
    %{
      json_chunk: %{
        data: %{"images" => images, "bufferViews" => buffer_views}
      },
      binary_chunk: %{data: binary_data}
    } = vrm

    for image <- images do
      %{"bufferView" => index, "mimeType" => mime_type, "name" => name} = image

      %{"byteOffset" => offset, "byteLength" => length} = Enum.at(buffer_views, index)

      <<_::size(offset)-bytes, image_data::size(length)-bytes, _::bits>> = binary_data
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
