defmodule VrmEx.Loader do
  alias VrmEx.{Chunk, Header}

  def load(data) do
    {header, chunk} = Header.load(data)
    [json, binary] = Chunk.load(chunk)

    %{header: header, data: json, binary: binary}
  end
end
