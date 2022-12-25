defmodule VrmEx.Chunk do
  defstruct [:length, :type, :data]

  @type t() :: %__MODULE__{
          length: integer(),
          type: String.t(),
          data: map() | binary()
        }

  @spec load(binary()) :: [t()]
  def load(<<
        length::32-little-integer,
        "JSON"::binary,
        data::size(length)-bytes,
        rest::bits
      >>) do
    data = Jason.decode!(data)

    [%__MODULE__{length: length, type: "JSON", data: data} | load(rest)]
  end

  def load(<<
        length::32-little-integer,
        "BIN\0"::binary,
        data::size(length)-bytes,
        rest::bits
      >>) do
    [%__MODULE__{length: length, type: "BIN\0", data: data} | load(rest)]
  end

  def load(<<>>) do
    []
  end
end
