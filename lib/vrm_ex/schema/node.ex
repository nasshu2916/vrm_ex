defmodule VrmEx.Schema.Node do
  @moduledoc """
  A node in the node hierarchy.  When the node contains `skin`, all `mesh.primitives` **MUST** contain `JOINTS_0` and `WEIGHTS_0` attributes.  A node **MAY** have either a `matrix` or any combination of `translation`/`rotation`/`scale` (TRS) properties. TRS properties are converted to matrices and postmultiplied in the `T * R * S` order to compose the transformation matrix; first the scale is applied to the vertices, then the rotation, and then the translation. If none are provided, the transform is the identity. When a node is targeted for animation (referenced by an animation.channel.target), `matrix` **MUST NOT** be present.
  """

  defstruct camera: nil,
            children: [],
            extensions: nil,
            extras: nil,
            matrix: [],
            mesh: nil,
            name: nil,
            rotation: [],
            scale: [],
            skin: nil,
            translation: [],
            weights: []

  @type t() :: %__MODULE__{
          camera: nil,
          children: [integer()],
          extensions: nil,
          extras: nil,
          matrix: [number()],
          mesh: nil,
          name: nil,
          rotation: [number()],
          scale: [number()],
          skin: nil,
          translation: [number()],
          weights: [number()]
        }

  use ExConstructor
end
