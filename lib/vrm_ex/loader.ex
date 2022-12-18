defmodule VrmEx.Loader do
  @magic_text "glTF"

  def load(data) do
    header(data)
  end

  def header(
        <<@magic_text>> <>
          <<2::32-little-integer>> <>
          <<file_size::32-little-integer>> <>
          chunk_data
      ) do
    %{
      file_size: file_size,
      chunk: chunk(chunk_data)
    }
  end

  def header(_) do
    :error
  end

  def chunk(
        <<chunk_size::32-little-integer>> <>
          <<chunk_type::4-bytes>> <>
          chunk_body
      ) do
    case chunk_body do
      <<chunk_data::size(chunk_size)-bytes>> <> buffer ->
        %{
          chunk_size: chunk_size,
          chunk_type: chunk_type,
          chunk_data: chunk_data,
          buffer: buffer
        }

      _ ->
        :error
    end
  end

  def chunk(_) do
    :error
  end
end
