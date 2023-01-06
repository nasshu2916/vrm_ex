defmodule Elixir.VrmEx.Schema.Vrm.Firstperson do
  @moduledoc false

  defstruct first_person_bone: nil,
            first_person_bone_offset: %{x: nil, y: nil, z: nil},
            look_at_horizontal_inner: %Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap{},
            look_at_horizontal_outer: %Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap{},
            look_at_type_name: nil,
            look_at_vertical_down: %Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap{},
            look_at_vertical_up: %Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap{},
            mesh_annotations: [%Elixir.VrmEx.Schema.Vrm.Firstperson.Meshannotation{}]

  @type t() :: %__MODULE__{
          first_person_bone: integer(),
          first_person_bone_offset: map(),
          look_at_horizontal_inner: Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap.t(),
          look_at_horizontal_outer: Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap.t(),
          look_at_type_name: String.t(),
          look_at_vertical_down: Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap.t(),
          look_at_vertical_up: Elixir.VrmEx.Schema.Vrm.Firstperson.Degreemap.t(),
          mesh_annotations: [Elixir.VrmEx.Schema.Vrm.Firstperson.Meshannotation.t()]
        }

  use ExConstructor
end
