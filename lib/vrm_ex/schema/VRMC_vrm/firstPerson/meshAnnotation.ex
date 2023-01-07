defmodule Elixir.VrmEx.Schema.MeshAnnotation do
  @moduledoc """
  Specify how the mesh should be interpreted by the camera
  """

  defstruct extensions: nil,
            extras: nil,
            node: nil,
            type: nil

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          node: nil,
          type: String.t()
        }

  use ExConstructor
end
