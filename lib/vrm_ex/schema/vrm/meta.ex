defmodule VrmEx.Schema.Vrm.Meta do
  @moduledoc false

  defstruct allowed_user_name: nil,
            author: nil,
            commercial_ussage_name: nil,
            contact_information: nil,
            license_name: nil,
            other_license_url: nil,
            other_permission_url: nil,
            reference: nil,
            sexual_ussage_name: nil,
            texture: nil,
            title: nil,
            version: nil,
            violent_ussage_name: nil

  @type t() :: %__MODULE__{
          allowed_user_name: String.t(),
          author: String.t(),
          commercial_ussage_name: String.t(),
          contact_information: String.t(),
          license_name: String.t(),
          other_license_url: String.t(),
          other_permission_url: String.t(),
          reference: String.t(),
          sexual_ussage_name: String.t(),
          texture: integer(),
          title: String.t(),
          version: String.t(),
          violent_ussage_name: String.t()
        }

  use ExConstructor
end
