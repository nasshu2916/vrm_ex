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

  defp chunk(<<
         chunk_size::32-little-integer,
         chunk_type::4-bytes,
         chunk_data::size(chunk_size)-bytes,
         binary_buffer::bits
       >>) do
    case Jason.decode(chunk_data, keys: :atoms) do
      {:ok, chunk_data} ->
        %{
          chunk_size: chunk_size,
          chunk_type: chunk_type,
          chunk_data: chunk_data,
          binary_buffer: binary_buffer
        }

      :error ->
        {:error, :failed_to_load_chunk_data}
    end
  end

  defp chunk(_) do
    {:error, :failed_to_load_chunk}
  end
end
