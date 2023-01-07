defmodule Elixir.VrmEx.Schema.Expressions do
  @moduledoc """
  Definition of expressions
  """

  defstruct custom: %{},
            extensions: nil,
            extras: nil,
            preset: %{
              aa: %Elixir.VrmEx.Schema.Expression{},
              angry: %Elixir.VrmEx.Schema.Expression{},
              blink: %Elixir.VrmEx.Schema.Expression{},
              blinkLeft: %Elixir.VrmEx.Schema.Expression{},
              blinkRight: %Elixir.VrmEx.Schema.Expression{},
              ee: %Elixir.VrmEx.Schema.Expression{},
              happy: %Elixir.VrmEx.Schema.Expression{},
              ih: %Elixir.VrmEx.Schema.Expression{},
              lookDown: %Elixir.VrmEx.Schema.Expression{},
              lookLeft: %Elixir.VrmEx.Schema.Expression{},
              lookRight: %Elixir.VrmEx.Schema.Expression{},
              lookUp: %Elixir.VrmEx.Schema.Expression{},
              neutral: %Elixir.VrmEx.Schema.Expression{},
              oh: %Elixir.VrmEx.Schema.Expression{},
              ou: %Elixir.VrmEx.Schema.Expression{},
              relaxed: %Elixir.VrmEx.Schema.Expression{},
              sad: %Elixir.VrmEx.Schema.Expression{},
              surprised: %Elixir.VrmEx.Schema.Expression{}
            }

  @type t() :: %__MODULE__{
          custom: map(),
          extensions: nil,
          extras: nil,
          preset: map()
        }

  use ExConstructor
end
