defmodule Elixir.VrmEx.Schema.Vrm.Firstperson.Meshannotation do
  @moduledoc false

  defstruct first_person_flag: nil,
            mesh: nil

  @type t() :: %__MODULE__{
          first_person_flag: String.t(),
          mesh: integer()
        }

  use ExConstructor
end
