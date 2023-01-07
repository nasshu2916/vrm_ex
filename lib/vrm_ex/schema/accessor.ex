defmodule VrmEx.Schema.Accessor do
  @moduledoc """
  A typed view into a buffer view that contains raw binary data.
  """

  defstruct buffer_view: nil,
            byte_offset: nil,
            component_type: nil,
            count: nil,
            extensions: nil,
            extras: nil,
            max: [],
            min: [],
            name: nil,
            normalized: nil,
            sparse: nil,
            type: nil

  @type t() :: %__MODULE__{
          buffer_view: nil,
          byte_offset: integer(),
          component_type: nil,
          count: integer(),
          extensions: nil,
          extras: nil,
          max: [number()],
          min: [number()],
          name: nil,
          normalized: boolean(),
          sparse: nil,
          type: nil
        }

  use ExConstructor
end
