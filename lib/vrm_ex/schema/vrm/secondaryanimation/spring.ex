defmodule VrmEx.Schema.Vrm.Secondaryanimation.Spring do
  @moduledoc false

  defstruct bones: [nil],
            center: nil,
            collider_groups: [nil],
            comment: nil,
            drag_force: nil,
            gravity_dir: %{x: nil, y: nil, z: nil},
            gravity_power: nil,
            hit_radius: nil,
            stiffiness: nil

  @type t() :: %__MODULE__{
          bones: [integer()],
          center: integer(),
          collider_groups: [integer()],
          comment: String.t(),
          drag_force: number(),
          gravity_dir: map(),
          gravity_power: number(),
          hit_radius: number(),
          stiffiness: number()
        }

  use ExConstructor
end
