defmodule Elixir.VrmEx.Schema.VRMCVrm do
  @moduledoc """

  """

  defstruct expressions: %Elixir.VrmEx.Schema.Expressions{},
            extensions: nil,
            extras: nil,
            first_person: %Elixir.VrmEx.Schema.FirstPerson{},
            humanoid: %Elixir.VrmEx.Schema.Humanoid{},
            look_at: %Elixir.VrmEx.Schema.LookAt{},
            meta: %Elixir.VrmEx.Schema.Meta{},
            spec_version: nil

  @type t() :: %__MODULE__{
          expressions: Elixir.VrmEx.Schema.Expressions.t(),
          extensions: nil,
          extras: nil,
          first_person: Elixir.VrmEx.Schema.FirstPerson.t(),
          humanoid: Elixir.VrmEx.Schema.Humanoid.t(),
          look_at: Elixir.VrmEx.Schema.LookAt.t(),
          meta: Elixir.VrmEx.Schema.Meta.t(),
          spec_version: String.t()
        }

  use ExConstructor
end
