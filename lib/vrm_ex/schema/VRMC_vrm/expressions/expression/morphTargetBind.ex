defmodule VrmEx.Schema.MorphTargetBind do
  @moduledoc """
  Morph target value associated with a expression
  """

  defstruct extensions: nil,
            extras: nil,
            index: nil,
            node: nil,
            weight: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          index: nil,
          node: nil,
          weight: number()
        }

  use ExConstructor
end
