defmodule Elixir.VrmEx.Schema.Scene do
  @moduledoc """
  The root nodes of a scene.
  """

  defstruct extensions: nil,
            extras: nil,
            name: nil,
            nodes: []

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          name: nil,
          nodes: [integer()]
        }

  use ExConstructor
end
