defmodule VrmEx.Chunk do
  defstruct [:length, :type, :data]

  @type json_chunk() :: %__MODULE__{
          length: integer(),
          type: :json,
          data: map()
        }

  @type bin() :: %__MODULE__{
          length: integer(),
          type: :bin,
          data: binary()
        }

  @type t() :: %__MODULE__{
          length: integer(),
          type: atom(),
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

    [%__MODULE__{length: length, type: :json, data: data} | load(rest)]
  end

  def load(<<
        length::32-little-integer,
        "BIN\0"::binary,
        data::size(length)-bytes,
        rest::bits
      >>) do
    [%__MODULE__{length: length, type: :bin, data: data} | load(rest)]
  end

  def load(<<>>) do
    []
  end
end
