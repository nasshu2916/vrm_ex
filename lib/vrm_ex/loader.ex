defmodule VrmEx.Loader do
  @magic_text "glTF"
  @vrm_version 2

  def load(data) do
    header(data)
  end

  defp header(<<
         @magic_text::binary,
         @vrm_version::32-little-integer,
         file_size::32-little-integer,
         chunk_data::bits
       >>) do
    %{
      version: @vrm_version,
      file_size: file_size,
      chunk: chunk(chunk_data)
    }
  end

  defp header(_) do
    {:error, :failed_to_load_headers}
  end

  defp chunk(<<size::32-little-integer, "JSON"::binary, data::size(size)-bytes, binary::bits>>) do
    case Jason.decode(data, keys: :atoms) do
      {:ok, data} ->
        %{size: size, type: "JSON", data: data, binary: chunk(binary)}

      :error ->
        {:error, :failed_to_decode_json}
    end
  end

  defp chunk(<<size::32-little-integer, "BIN\0"::binary, data::size(size)-bytes>>) do
    %{size: size, type: "BIN\0", data: data}
  end

  defp chunk(_) do
    {:error, :failed_to_load_chunk}
  end
end
