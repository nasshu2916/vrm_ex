defmodule VrmEx.Schema.Vrm.Blendshape do
  @moduledoc """
  BlendShapeAvatar of UniVRM
  """

  defstruct blend_shape_groups: []

  @type t() :: %__MODULE__{
          blend_shape_groups: [VrmEx.Schema.Vrm.Blendshape.Group.t()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | blend_shape_groups:
          Enum.map(struct.blend_shape_groups, &VrmEx.Schema.Vrm.Blendshape.Group.new/1)
    }
  end
end
