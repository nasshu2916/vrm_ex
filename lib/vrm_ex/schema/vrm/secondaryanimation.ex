defmodule VrmEx.Schema.Vrm.Secondaryanimation do
  @moduledoc """
  The setting of automatic animation of string-like objects such as tails and hairs.
  """

  defstruct bone_groups: [%VrmEx.Schema.Vrm.Secondaryanimation.Spring{}],
            collider_groups: [%VrmEx.Schema.Vrm.Secondaryanimation.Collidergroup{}]

  @type t() :: %__MODULE__{
          bone_groups: [VrmEx.Schema.Vrm.Secondaryanimation.Spring.t()],
          collider_groups: [VrmEx.Schema.Vrm.Secondaryanimation.Collidergroup.t()]
        }

  use ExConstructor
end
