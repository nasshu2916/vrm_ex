defmodule Elixir.VrmEx.Schema.Humanoid do
  @moduledoc """
  Correspondence between nodes and human bones
  """

  defstruct extensions: nil,
            extras: nil,
            human_bones: %Elixir.VrmEx.Schema.HumanBones{}

  @type t() :: %__MODULE__{
          extensions: nil,
          extras: nil,
          human_bones: Elixir.VrmEx.Schema.HumanBones.t()
        }

  use ExConstructor
end
