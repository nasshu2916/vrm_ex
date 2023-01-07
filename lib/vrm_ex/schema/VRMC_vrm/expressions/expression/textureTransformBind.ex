defmodule VrmEx.Schema.TextureTransformBind do
  @moduledoc """
  Texture transform value associated with a expression
  """

  defstruct extensions: nil,
            extras: nil,
            material: nil,
            offset: [nil],
            scale: [nil]

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          material: nil,
          offset: [number()],
          scale: [number()]
        }

  use ExConstructor
end
