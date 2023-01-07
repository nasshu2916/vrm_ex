defmodule VrmEx.Schema.AnimationChannel do
  @moduledoc """
  An animation channel combines an animation sampler with a target property being animated.
  """

  defstruct extensions: nil,
            extras: nil,
            sampler: nil,
            target: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          sampler: nil,
          target: nil
        }

  use ExConstructor
end
