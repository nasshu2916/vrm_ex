defmodule VrmEx.Schema.Vrm do
  @moduledoc """
  VRM extension is for 3d humanoid avatars (and models) in VR applications.
  """

  defstruct blend_shape_master: %VrmEx.Schema.Vrm.Blendshape{},
            exporter_version: nil,
            first_person: %VrmEx.Schema.Vrm.Firstperson{},
            humanoid: %VrmEx.Schema.Vrm.Humanoid{},
            material_properties: [%VrmEx.Schema.Vrm.Material{}],
            meta: %VrmEx.Schema.Vrm.Meta{},
            secondary_animation: %VrmEx.Schema.Vrm.Secondaryanimation{},
            spec_version: nil

  @type t() :: %__MODULE__{
          blend_shape_master: VrmEx.Schema.Vrm.Blendshape.t(),
          exporter_version: String.t(),
          first_person: VrmEx.Schema.Vrm.Firstperson.t(),
          humanoid: VrmEx.Schema.Vrm.Humanoid.t(),
          material_properties: [VrmEx.Schema.Vrm.Material.t()],
          meta: VrmEx.Schema.Vrm.Meta.t(),
          secondary_animation: VrmEx.Schema.Vrm.Secondaryanimation.t(),
          spec_version: String.t()
        }

  use ExConstructor
end
