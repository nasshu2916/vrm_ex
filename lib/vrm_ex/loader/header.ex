defmodule VrmEx.Loader.Header do
  defstruct [:version, :length]

  @magic_text "glTF"
  @version 2
  @header_size 12

  @type t() :: %__MODULE__{
          version: integer(),
          length: integer()
        }

  @spec load(binary()) :: {:ok, {t(), binary()}} | {:error, String.t()}
  def load(<<
        @magic_text::binary,
        @version::32-little-integer,
        length::32-little-integer,
        rest::size((length - @header_size) * 8)-bits
      >>) do
    {:ok, {%__MODULE__{version: @version, length: length}, rest}}
  end

  def load(_) do
    {:error, "failed_load_header"}
  end
end
