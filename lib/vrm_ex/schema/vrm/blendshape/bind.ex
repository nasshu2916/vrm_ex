defmodule VrmEx.Schema.Vrm.Blendshape.Bind do
  @moduledoc false

  defstruct index: nil,
            mesh: nil,
            weight: nil

  @type t() :: %__MODULE__{
          index: integer(),
          mesh: integer(),
          weight: number()
        }

  use ExConstructor
end
