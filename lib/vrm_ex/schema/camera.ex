defmodule VrmEx.Schema.Camera do
  @moduledoc """
  A camera's projection.  A node **MAY** reference a camera to apply a transform to place the camera in the scene.
  """

  defstruct extensions: nil,
            extras: nil,
            name: nil,
            orthographic: nil,
            perspective: nil,
            type: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          name: nil,
          orthographic: nil,
          perspective: nil,
          type: nil
        }

  use ExConstructor
end
