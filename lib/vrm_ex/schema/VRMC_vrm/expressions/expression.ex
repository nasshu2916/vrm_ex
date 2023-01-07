defmodule VrmEx.Schema.Expression do
  @moduledoc """
  Definition of expression by weighted animation
  """

  defstruct extensions: nil,
            extras: nil,
            is_binary: nil,
            material_color_binds: [],
            morph_target_binds: [],
            override_blink: nil,
            override_look_at: nil,
            override_mouth: nil,
            texture_transform_binds: []

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          is_binary: boolean(),
          material_color_binds: [VrmEx.Schema.MaterialColorBind.t()],
          morph_target_binds: [VrmEx.Schema.MorphTargetBind.t()],
          override_blink: String.t(),
          override_look_at: String.t(),
          override_mouth: String.t(),
          texture_transform_binds: [VrmEx.Schema.TextureTransformBind.t()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | material_color_binds:
          Enum.map(struct.material_color_binds, &VrmEx.Schema.MaterialColorBind.new/1),
        morph_target_binds:
          Enum.map(struct.morph_target_binds, &VrmEx.Schema.MorphTargetBind.new/1),
        texture_transform_binds:
          Enum.map(struct.texture_transform_binds, &VrmEx.Schema.TextureTransformBind.new/1)
    }
  end
end
