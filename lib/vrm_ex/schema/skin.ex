defmodule VrmEx.Schema.Skin do
  @moduledoc """
  Joints and matrices defining a skin.
  """

  defstruct extensions: nil,
            extras: nil,
            inverse_bind_matrices: nil,
            joints: [],
            name: nil,
            skeleton: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          inverse_bind_matrices: nil,
          joints: [integer()],
          name: nil,
          skeleton: nil
        }

  use ExConstructor
end
