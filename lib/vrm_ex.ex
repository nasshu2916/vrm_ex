defmodule VrmEx do
  @moduledoc """
  Documentation for `VrmEx`.
  """
  alias VrmEx.Loader

  def load(iodata, _opts \\ []) do
    iodata
    |> IO.iodata_to_binary()
    |> Loader.load()
  end

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
