defmodule VrmEx do
  @moduledoc """
  Documentation for `VrmEx`.
  """
  alias VrmEx.{Chunk, Header, Loader}

  defstruct [:header, :json_chunk, :binary_chunk]

  @type t() :: %__MODULE__{
          header: Header.t(),
          json_chunk: Chunk.json_chunk(),
          binary_chunk: Chunk.bin()
        }
  @type image :: %{
          mime_type: String.t(),
          name: String.t(),
          data: binary()
        }

  @spec load(iodata()) :: t()
  def load(iodata) do
    iodata
    |> IO.iodata_to_binary()
    |> Loader.load()
  end

  @spec meta(t()) :: map()
  def meta(vrm) do
    %{
      json_chunk: %{
        data: %{"extensions" => %{"VRM" => %{"meta" => meta}}}
      }
    } = vrm

    meta
  end

  @spec thumbnail(t()) :: image()
  def thumbnail(vrm) do
    %{
      json_chunk: %{
        data: %{"images" => images, "bufferViews" => buffer_views}
      },
      binary_chunk: %{data: binary_data}
    } = vrm

    %{"texture" => thumbnail_index} = meta(vrm)

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
