defmodule VrmEx.Schema.Animation do
  @moduledoc """
  A keyframe animation.
  """

  defstruct channels: [],
            extensions: nil,
            extras: nil,
            name: nil,
            samplers: []

  @type t() :: %__MODULE__{
          channels: [VrmEx.Schema.AnimationChannel.t()],
          extensions: nil,
          extras: nil,
          name: nil,
          samplers: [VrmEx.Schema.AnimationSampler.t()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | channels: Enum.map(struct.channels, &VrmEx.Schema.AnimationChannel.new/1),
        samplers: Enum.map(struct.samplers, &VrmEx.Schema.AnimationSampler.new/1)
    }
  end
end
