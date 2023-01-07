defmodule VrmEx.Schema.MeshPrimitive do
  @moduledoc """
  Geometry to be rendered with the given material.
  """

  defstruct attributes: %{},
            extensions: nil,
            extras: nil,
            indices: nil,
            material: nil,
            mode: nil,
            targets: [%{}]

  @type t() :: %__MODULE__{
          attributes: map(),
          extensions: nil,
          extras: nil,
          indices: nil,
          material: nil,
          mode: nil,
          targets: [map()]
        }

  use ExConstructor
end
