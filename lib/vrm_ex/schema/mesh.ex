defmodule Elixir.VrmEx.Schema.Mesh do
  @moduledoc """
  A set of primitives to be rendered.  Its global transform is defined by a node that references it.
  """

  defstruct extensions: nil,
            extras: nil,
            name: nil,
            primitives: [%Elixir.VrmEx.Schema.MeshPrimitive{}],
            weights: [nil]

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          name: nil,
          primitives: [Elixir.VrmEx.Schema.MeshPrimitive.t()],
          weights: [number()]
        }

  use ExConstructor
end