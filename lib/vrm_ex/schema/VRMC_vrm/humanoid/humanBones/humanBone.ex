defmodule VrmEx.Schema.HumanBone do
  @moduledoc """
  Represents a single bone of a Humanoid.
  """

  defstruct extensions: nil,
            extras: nil,
            node: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          node: nil
        }

  use ExConstructor
end
