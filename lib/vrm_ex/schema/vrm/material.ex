defmodule VrmEx.Schema.Vrm.Material do
  @moduledoc false

  defstruct float_properties: %{},
            keyword_map: %{},
            name: nil,
            render_queue: nil,
            shader: nil,
            tag_map: %{},
            texture_properties: %{},
            vector_properties: %{}

  @type t() :: %__MODULE__{
          float_properties: map(),
          keyword_map: map(),
          name: String.t(),
          render_queue: integer(),
          shader: String.t(),
          tag_map: map(),
          texture_properties: map(),
          vector_properties: map()
        }

  use ExConstructor
end
