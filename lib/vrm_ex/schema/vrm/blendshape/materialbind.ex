defmodule Elixir.VrmEx.Schema.Vrm.Blendshape.Materialbind do
  @moduledoc false

  defstruct material_name: nil,
            property_name: nil,
            target_value: [nil]

  @type t() :: %__MODULE__{
          material_name: String.t(),
          property_name: String.t(),
          target_value: [number()]
        }

  use ExConstructor
end
