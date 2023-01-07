defmodule VrmEx.Schema.BufferView do
  @moduledoc """
  A view into a buffer generally representing a subset of the buffer.
  """

  defstruct buffer: nil,
            byte_length: nil,
            byte_offset: nil,
            byte_stride: nil,
            extensions: nil,
            extras: nil,
            name: nil,
            target: nil

  @type t() :: %__MODULE__{
          buffer: nil,
          byte_length: integer(),
          byte_offset: integer(),
          byte_stride: integer(),
          extensions: nil,
          extras: nil,
          name: nil,
          target: nil
        }

  use ExConstructor
end
