defmodule Elixir.VrmEx.Schema.Expression do
  @moduledoc """
  Definition of expression by weighted animation
  """

  defstruct extensions: nil,
            extras: nil,
            is_binary: nil,
            material_color_binds: [%Elixir.VrmEx.Schema.MaterialColorBind{}],
            morph_target_binds: [%Elixir.VrmEx.Schema.MorphTargetBind{}],
            override_blink: nil,
            override_look_at: nil,
            override_mouth: nil,
            texture_transform_binds: [%Elixir.VrmEx.Schema.TextureTransformBind{}]

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          is_binary: boolean(),
          material_color_binds: [Elixir.VrmEx.Schema.MaterialColorBind.t()],
          morph_target_binds: [Elixir.VrmEx.Schema.MorphTargetBind.t()],
          override_blink: String.t(),
          override_look_at: String.t(),
          override_mouth: String.t(),
          texture_transform_binds: [Elixir.VrmEx.Schema.TextureTransformBind.t()]
        }

  use ExConstructor
end
