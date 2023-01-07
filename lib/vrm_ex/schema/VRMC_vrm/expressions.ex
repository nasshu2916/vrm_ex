defmodule VrmEx.Schema.Expressions do
  @moduledoc """
  Definition of expressions
  """

  defstruct custom: %{},
            extensions: nil,
            extras: nil,
            preset: %{
              aa: %VrmEx.Schema.Expression{},
              angry: %VrmEx.Schema.Expression{},
              blink: %VrmEx.Schema.Expression{},
              blinkLeft: %VrmEx.Schema.Expression{},
              blinkRight: %VrmEx.Schema.Expression{},
              ee: %VrmEx.Schema.Expression{},
              happy: %VrmEx.Schema.Expression{},
              ih: %VrmEx.Schema.Expression{},
              lookDown: %VrmEx.Schema.Expression{},
              lookLeft: %VrmEx.Schema.Expression{},
              lookRight: %VrmEx.Schema.Expression{},
              lookUp: %VrmEx.Schema.Expression{},
              neutral: %VrmEx.Schema.Expression{},
              oh: %VrmEx.Schema.Expression{},
              ou: %VrmEx.Schema.Expression{},
              relaxed: %VrmEx.Schema.Expression{},
              sad: %VrmEx.Schema.Expression{},
              surprised: %VrmEx.Schema.Expression{}
            }

  @type t() :: %__MODULE__{
          custom: map(),
          extensions: nil,
          extras: nil,
          preset: map()
        }

  use ExConstructor
end
