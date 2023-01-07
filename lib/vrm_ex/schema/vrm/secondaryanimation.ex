defmodule VrmEx.Schema.Vrm.Secondaryanimation do
  @moduledoc """
  The setting of automatic animation of string-like objects such as tails and hairs.
  """

  defstruct bone_groups: [],
            collider_groups: []

  @type t() :: %__MODULE__{
          bone_groups: [VrmEx.Schema.Vrm.Secondaryanimation.Spring.t()],
          collider_groups: [VrmEx.Schema.Vrm.Secondaryanimation.Collidergroup.t()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | bone_groups:
          Enum.map(struct.bone_groups, &VrmEx.Schema.Vrm.Secondaryanimation.Spring.new/1),
        collider_groups:
          Enum.map(
            struct.collider_groups,
            &VrmEx.Schema.Vrm.Secondaryanimation.Collidergroup.new/1
          )
    }
  end
end
