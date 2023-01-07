defmodule Elixir.VrmEx.Schema.LookAtRangeMap do
  @moduledoc """
  Horizontal inward movement. The left eye moves right. The right eye moves left.
  """

  defstruct extensions: nil,
            extras: nil,
            input_max_value: nil,
            output_scale: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          input_max_value: number(),
          output_scale: number()
        }

  use ExConstructor
end
