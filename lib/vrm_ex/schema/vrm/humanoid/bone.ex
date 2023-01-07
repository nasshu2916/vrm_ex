defmodule VrmEx.Schema.Vrm.Humanoid.Bone do
  @moduledoc false

  defstruct axis_length: nil,
            bone: nil,
            center: %{x: nil, y: nil, z: nil},
            max: %{x: nil, y: nil, z: nil},
            min: %{x: nil, y: nil, z: nil},
            node: nil,
            use_default_values: nil

  @type t() :: %__MODULE__{
          axis_length: number(),
          bone: String.t(),
          center: map(),
          max: map(),
          min: map(),
          node: integer(),
          use_default_values: boolean()
        }

  use ExConstructor
end
