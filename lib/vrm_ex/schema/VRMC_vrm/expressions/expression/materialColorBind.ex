defmodule VrmEx.Schema.MaterialColorBind do
  @moduledoc """
  Material color value associated with a expression
  """

  defstruct extensions: nil,
            extras: nil,
            material: nil,
            target_value: [nil],
            type: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          material: nil,
          target_value: [number()],
          type: String.t()
        }

  use ExConstructor
end
