defmodule VrmEx.Schema.Mesh do
  @moduledoc """
  A set of primitives to be rendered.  Its global transform is defined by a node that references it.
  """

  defstruct extensions: nil,
            extras: nil,
            name: nil,
            primitives: [],
            weights: []

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          name: nil,
          primitives: [VrmEx.Schema.MeshPrimitive.t()],
          weights: [number()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{struct | primitives: Enum.map(struct.primitives, &VrmEx.Schema.MeshPrimitive.new/1)}
  end
end
