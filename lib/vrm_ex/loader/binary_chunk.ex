defmodule VrmEx.Loader.BinaryChunk do
  defstruct [:length, :data]

  @chunk_type "BIN\0"

  @type t() :: %__MODULE__{
          length: integer(),
          data: binary()
        }

  @spec load(binary()) :: {:ok, {t(), binary()}} | {:error, String.t()}
  def load(<<
        length::32-little-integer,
        @chunk_type::binary,
        data::size(length)-bytes,
        rest::bits
      >>) do
    {:ok, {%__MODULE__{length: length, data: data}, rest}}
  end

  def load() do
    {:error, "invalid_binary_chunk"}
  end
end
