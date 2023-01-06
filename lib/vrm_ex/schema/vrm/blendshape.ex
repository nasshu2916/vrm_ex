defmodule Elixir.VrmEx.Schema.Vrm.Blendshape do
  @moduledoc """
  BlendShapeAvatar of UniVRM
  """

  defstruct blend_shape_groups: [%Elixir.VrmEx.Schema.Vrm.Blendshape.Group{}]

  @type t() :: %__MODULE__{
          blend_shape_groups: [Elixir.VrmEx.Schema.Vrm.Blendshape.Group.t()]
        }

  use ExConstructor
end
