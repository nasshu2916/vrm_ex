defmodule VrmEx.Loader do
  alias VrmEx.Loader.{BinaryChunk, Header, JsonChunk}

  @spec load(binary()) :: {:ok, VrmEx.t()} | {:error, String.t()}
  def load(binary_data) do
    with {:ok, {header, rest}} <- Header.load(binary_data),
         {:ok, {json, rest}} <- JsonChunk.load(rest),
         {:ok, {binary, <<>>}} <- BinaryChunk.load(rest) do
      {:ok, %VrmEx{header: header, json_chunk: json, binary_chunk: binary}}
    end
  end
end
