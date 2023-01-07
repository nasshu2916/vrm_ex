defmodule VrmEx.Schema.Vrm.Blendshape.Group do
  @moduledoc false

  defstruct binds: [],
            is_binary: nil,
            material_values: [],
            name: nil,
            preset_name: nil

  @type t() :: %__MODULE__{
          binds: [VrmEx.Schema.Vrm.Blendshape.Bind.t()],
          is_binary: boolean(),
          material_values: [VrmEx.Schema.Vrm.Blendshape.Materialbind.t()],
          name: String.t(),
          preset_name: String.t()
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | binds: Enum.map(struct.binds, &VrmEx.Schema.Vrm.Blendshape.Bind.new/1),
        material_values:
          Enum.map(struct.material_values, &VrmEx.Schema.Vrm.Blendshape.Materialbind.new/1)
    }
  end
end
