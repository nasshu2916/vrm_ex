defmodule VrmEx.Schema.Sampler do
  @moduledoc """
  Texture sampler properties for filtering and wrapping modes.
  """

  defstruct extensions: nil,
            extras: nil,
            mag_filter: nil,
            min_filter: nil,
            name: nil,
            wrap_s: nil,
            wrap_t: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          mag_filter: nil,
          min_filter: nil,
          name: nil,
          wrap_s: nil,
          wrap_t: nil
        }

  use ExConstructor
end
