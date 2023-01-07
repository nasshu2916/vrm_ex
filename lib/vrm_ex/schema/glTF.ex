defmodule VrmEx.Schema.GlTF do
  @moduledoc """
  The root object for a glTF asset.
  """

  defstruct accessors: [%VrmEx.Schema.Accessor{}],
            animations: [%VrmEx.Schema.Animation{}],
            asset: nil,
            buffer_views: [%VrmEx.Schema.BufferView{}],
            buffers: [%VrmEx.Schema.Buffer{}],
            cameras: [%VrmEx.Schema.Camera{}],
            extensions: nil,
            extensions_required: [],
            extensions_used: [],
            extras: nil,
            images: [%VrmEx.Schema.Image{}],
            materials: [%VrmEx.Schema.Material{}],
            meshes: [%VrmEx.Schema.Mesh{}],
            nodes: [%VrmEx.Schema.Node{}],
            samplers: [%VrmEx.Schema.Sampler{}],
            scene: nil,
            scenes: [%VrmEx.Schema.Scene{}],
            skins: [%VrmEx.Schema.Skin{}],
            textures: [%VrmEx.Schema.Texture{}]

  @type t() :: %__MODULE__{
          accessors: [VrmEx.Schema.Accessor.t()],
          animations: [VrmEx.Schema.Animation.t()],
          asset: nil,
          buffer_views: [VrmEx.Schema.BufferView.t()],
          buffers: [VrmEx.Schema.Buffer.t()],
          cameras: [VrmEx.Schema.Camera.t()],
          extensions: nil,
          extensions_required: [String.t()],
          extensions_used: [String.t()],
          extras: nil,
          images: [VrmEx.Schema.Image.t()],
          materials: [VrmEx.Schema.Material.t()],
          meshes: [VrmEx.Schema.Mesh.t()],
          nodes: [VrmEx.Schema.Node.t()],
          samplers: [VrmEx.Schema.Sampler.t()],
          scene: nil,
          scenes: [VrmEx.Schema.Scene.t()],
          skins: [VrmEx.Schema.Skin.t()],
          textures: [VrmEx.Schema.Texture.t()]
        }

  use ExConstructor
end
