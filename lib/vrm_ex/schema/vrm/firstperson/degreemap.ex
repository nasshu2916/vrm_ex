defmodule VrmEx.Schema.Vrm.Firstperson.Degreemap do
  @moduledoc """
  Eye controller setting.
  """

  defstruct curve: [nil],
            x_range: nil,
            y_range: nil

  @type t() :: %__MODULE__{
          curve: [number()],
          x_range: number(),
          y_range: number()
        }

  use ExConstructor
end
