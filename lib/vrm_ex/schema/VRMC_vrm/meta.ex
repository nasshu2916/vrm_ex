defmodule VrmEx.Schema.Meta do
  @moduledoc """

  """

  defstruct allow_antisocial_or_hate_usage: nil,
            allow_excessively_sexual_usage: nil,
            allow_excessively_violent_usage: nil,
            allow_political_or_religious_usage: nil,
            allow_redistribution: nil,
            authors: [],
            avatar_permission: nil,
            commercial_usage: nil,
            contact_information: nil,
            copyright_information: nil,
            credit_notation: nil,
            extensions: nil,
            extras: nil,
            license_url: nil,
            modification: nil,
            name: nil,
            other_license_url: nil,
            references: [],
            third_party_licenses: nil,
            thumbnail_image: nil,
            version: nil

  @type t() :: %__MODULE__{
          allow_antisocial_or_hate_usage: boolean(),
          allow_excessively_sexual_usage: boolean(),
          allow_excessively_violent_usage: boolean(),
          allow_political_or_religious_usage: boolean(),
          allow_redistribution: boolean(),
          authors: [String.t()],
          avatar_permission: String.t(),
          commercial_usage: String.t(),
          contact_information: String.t(),
          copyright_information: String.t(),
          credit_notation: String.t(),
          extensions: nil,
          extras: nil,
          license_url: String.t(),
          modification: String.t(),
          name: String.t(),
          other_license_url: String.t(),
          references: [String.t()],
          third_party_licenses: String.t(),
          thumbnail_image: nil,
          version: String.t()
        }

  use ExConstructor
end
