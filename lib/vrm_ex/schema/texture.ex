defmodule VrmEx.Schema.Texture do
  @moduledoc """
  A texture and its sampler.
  """

  defstruct extensions: nil,
            extras: nil,
            name: nil,
            sampler: nil,
            source: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          name: nil,
          sampler: nil,
          source: nil
        }

  use ExConstructor
end
