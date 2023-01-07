defmodule VrmEx.Schema.Image do
  @moduledoc """
  Image data used to create a texture. Image **MAY** be referenced by an URI (or IRI) or a buffer view index.
  """

  defstruct buffer_view: nil,
            extensions: nil,
            extras: nil,
            mime_type: nil,
            name: nil,
            uri: nil

  @type t() :: %__MODULE__{
          buffer_view: nil,
          extensions: nil,
          extras: nil,
          mime_type: nil,
          name: nil,
          uri: String.t()
        }

  use ExConstructor
end
