defmodule VrmEx.Loader do
  alias VrmEx.{Chunk, Header}

  def load(data) do
    {header, chunk} = Header.load(data)
    [json, binary] = Chunk.load(chunk)

    %VrmEx{header: header, json_chunk: json, binary_chunk: binary}
  end
end
