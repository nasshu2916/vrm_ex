defmodule VrmEx.Schema.VRMCVrm do
  @moduledoc """

  """

  defstruct expressions: %VrmEx.Schema.Expressions{},
            extensions: nil,
            extras: nil,
            first_person: %VrmEx.Schema.FirstPerson{},
            humanoid: %VrmEx.Schema.Humanoid{},
            look_at: %VrmEx.Schema.LookAt{},
            meta: %VrmEx.Schema.Meta{},
            spec_version: nil

  @type t() :: %__MODULE__{
          expressions: VrmEx.Schema.Expressions.t(),
          extensions: nil,
          extras: nil,
          first_person: VrmEx.Schema.FirstPerson.t(),
          humanoid: VrmEx.Schema.Humanoid.t(),
          look_at: VrmEx.Schema.LookAt.t(),
          meta: VrmEx.Schema.Meta.t(),
          spec_version: String.t()
        }

  use ExConstructor
end
