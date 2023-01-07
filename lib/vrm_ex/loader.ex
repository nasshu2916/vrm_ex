defmodule VrmEx.Loader do
  alias VrmEx.Loader.{BinaryChunk, Header, JsonChunk}

  @spec load(binary()) :: {:ok, VrmEx.t()} | {:error, String.t()}
  def load(binary_data) do
    with {:ok, {_header, rest}} <- Header.load(binary_data),
         {:ok, {json, rest}} <- JsonChunk.load(rest),
         {:ok, {binary, <<>>}} <- BinaryChunk.load(rest) do
      {:ok, %VrmEx{json_data: json.data, binary: binary.data}}
    end
  end
end
