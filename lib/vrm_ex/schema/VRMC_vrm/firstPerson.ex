defmodule Elixir.VrmEx.Schema.FirstPerson do
  @moduledoc """
  First-person perspective settings
  """

  defstruct extensions: nil,
            extras: nil,
            mesh_annotations: [%Elixir.VrmEx.Schema.MeshAnnotation{}]

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          mesh_annotations: [Elixir.VrmEx.Schema.MeshAnnotation.t()]
        }

  use ExConstructor
end
