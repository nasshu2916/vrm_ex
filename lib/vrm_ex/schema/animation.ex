defmodule Elixir.VrmEx.Schema.Animation do
  @moduledoc """
  A keyframe animation.
  """

  defstruct channels: [%Elixir.VrmEx.Schema.AnimationChannel{}],
            extensions: nil,
            extras: nil,
            name: nil,
            samplers: [%Elixir.VrmEx.Schema.AnimationSampler{}]

  @type t() :: %__MODULE__{
          channels: [Elixir.VrmEx.Schema.AnimationChannel.t()],
          extensions: nil,
          extras: nil,
          name: nil,
          samplers: [Elixir.VrmEx.Schema.AnimationSampler.t()]
        }

  use ExConstructor
end
