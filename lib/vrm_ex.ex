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

  @spec load(iodata()) :: t()
  def load(iodata) do
    iodata
    |> IO.iodata_to_binary()
    |> Loader.load()
  end

  @spec thumbnail(t()) :: %{mime_type: String.t(), name: String.t(), image: binary()}
  def thumbnail(vrm) do
    %{
      json_chunk: %{
        data: %{"extensions" => extensions, "images" => images, "bufferViews" => buffer_views}
      },
      binary_chunk: %{data: binary_data}
    } = vrm

    %{"mimeType" => mime_type, "name" => name, "bufferView" => index} =
      Enum.at(images, get_in(extensions, ["VRM", "meta", "texture"]))

    %{"byteOffset" => offset, "byteLength" => length} = Enum.at(buffer_views, index)

    <<_::size(offset)-bytes, image::size(length)-bytes, _::bits>> = binary_data
    %{mime_type: mime_type, name: name, image: image}
  end
end
