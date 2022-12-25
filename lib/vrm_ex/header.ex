defmodule VrmEx.Header do
  @magic_text "glTF"
  @version 2

  defstruct [:version, :length]

  @type t() :: %__MODULE__{
          version: integer(),
          length: integer()
        }

  @spec load(binary()) :: {t(), binary()}
  def load(<<
        @magic_text::binary,
        @version::32-little-integer,
        length::32-little-integer,
        rest::bits
      >>) do
    {%__MODULE__{version: @version, length: length}, rest}
  end
end
