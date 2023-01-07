defmodule VrmEx.Schema.Vrm.Humanoid do
  @moduledoc false

  defstruct arm_stretch: nil,
            feet_spacing: nil,
            has_translation_do_f: nil,
            human_bones: [],
            leg_stretch: nil,
            lower_arm_twist: nil,
            lower_leg_twist: nil,
            upper_arm_twist: nil,
            upper_leg_twist: nil

  @type t() :: %__MODULE__{
          arm_stretch: number(),
          feet_spacing: number(),
          has_translation_do_f: boolean(),
          human_bones: [VrmEx.Schema.Vrm.Humanoid.Bone.t()],
          leg_stretch: number(),
          lower_arm_twist: number(),
          lower_leg_twist: number(),
          upper_arm_twist: number(),
          upper_leg_twist: number()
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | human_bones: Enum.map(struct.human_bones, &VrmEx.Schema.Vrm.Humanoid.Bone.new/1)
    }
  end
end
