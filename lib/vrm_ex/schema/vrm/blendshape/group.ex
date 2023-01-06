defmodule Elixir.VrmEx.Schema.Vrm.Blendshape.Group do
  @moduledoc false

  defstruct binds: [%Elixir.VrmEx.Schema.Vrm.Blendshape.Bind{}],
            is_binary: nil,
            material_values: [%Elixir.VrmEx.Schema.Vrm.Blendshape.Materialbind{}],
            name: nil,
            preset_name: nil

  @type t() :: %__MODULE__{
          binds: [Elixir.VrmEx.Schema.Vrm.Blendshape.Bind.t()],
          is_binary: boolean(),
          material_values: [Elixir.VrmEx.Schema.Vrm.Blendshape.Materialbind.t()],
          name: String.t(),
          preset_name: String.t()
        }

  use ExConstructor
end
