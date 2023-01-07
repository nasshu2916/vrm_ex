defmodule Elixir.VrmEx.Schema.Material do
  @moduledoc """
  The material appearance of a primitive.
  """

  defstruct alpha_cutoff: nil,
            alpha_mode: nil,
            double_sided: nil,
            emissive_factor: [nil],
            emissive_texture: nil,
            extensions: nil,
            extras: nil,
            name: nil,
            normal_texture: nil,
            occlusion_texture: nil,
            pbr_metallic_roughness: nil

  @type t() :: %__MODULE__{
          alpha_cutoff: number(),
          alpha_mode: nil,
          double_sided: boolean(),
          emissive_factor: [number()],
          emissive_texture: nil,
          extensions: nil,
          extras: nil,
          name: nil,
          normal_texture: nil,
          occlusion_texture: nil,
          pbr_metallic_roughness: nil
        }

  use ExConstructor
end
