defmodule VrmEx.Schema.Animation do
  @moduledoc """
  A keyframe animation.
  """

  defstruct channels: [%VrmEx.Schema.AnimationChannel{}],
            extensions: nil,
            extras: nil,
            name: nil,
            samplers: [%VrmEx.Schema.AnimationSampler{}]

  @type t() :: %__MODULE__{
          channels: [VrmEx.Schema.AnimationChannel.t()],
          extensions: nil,
          extras: nil,
          name: nil,
          samplers: [VrmEx.Schema.AnimationSampler.t()]
        }

  use ExConstructor
end
