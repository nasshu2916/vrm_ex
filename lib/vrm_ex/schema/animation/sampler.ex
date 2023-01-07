defmodule VrmEx.Schema.AnimationSampler do
  @moduledoc """
  An animation sampler combines timestamps with a sequence of output values and defines an interpolation algorithm.
  """

  defstruct extensions: nil,
            extras: nil,
            input: nil,
            interpolation: nil,
            output: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          input: nil,
          interpolation: nil,
          output: nil
        }

  use ExConstructor
end
