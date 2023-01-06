defmodule Elixir.VrmEx.Schema.Vrm.Secondaryanimation.Collidergroup do
  @moduledoc false

  defstruct colliders: [%{offset: %{x: nil, y: nil, z: nil}, radius: nil}],
            node: nil

  @type t() :: %__MODULE__{
          colliders: [map()],
          node: integer()
        }

  use ExConstructor
end
