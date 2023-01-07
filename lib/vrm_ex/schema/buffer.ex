defmodule VrmEx.Schema.Buffer do
  @moduledoc """
  A buffer points to binary geometry, animation, or skins.
  """

  defstruct byte_length: nil,
            extensions: nil,
            extras: nil,
            name: nil,
            uri: nil

  @type t() :: %__MODULE__{
          byte_length: integer(),
          extensions: nil,
          extras: nil,
          name: nil,
          uri: String.t()
        }

  use ExConstructor
end
