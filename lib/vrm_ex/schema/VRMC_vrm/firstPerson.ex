defmodule VrmEx.Schema.FirstPerson do
  @moduledoc """
  First-person perspective settings
  """

  defstruct extensions: nil,
            extras: nil,
            mesh_annotations: []

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          mesh_annotations: [VrmEx.Schema.MeshAnnotation.t()]
        }

  use ExConstructor

  def new(map) do
    struct = super(map)

    %{
      struct
      | mesh_annotations: Enum.map(struct.mesh_annotations, &VrmEx.Schema.MeshAnnotation.new/1)
    }
  end
end
