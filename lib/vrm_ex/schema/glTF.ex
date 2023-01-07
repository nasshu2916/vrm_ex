defmodule Elixir.VrmEx.Schema.GlTF do
  @moduledoc """
  The root object for a glTF asset.
  """

  defstruct accessors: [%Elixir.VrmEx.Schema.Accessor{}],
            animations: [%Elixir.VrmEx.Schema.Animation{}],
            asset: nil,
            buffer_views: [%Elixir.VrmEx.Schema.BufferView{}],
            buffers: [%Elixir.VrmEx.Schema.Buffer{}],
            cameras: [%Elixir.VrmEx.Schema.Camera{}],
            extensions: nil,
            extensions_required: [nil],
            extensions_used: [nil],
            extras: nil,
            images: [%Elixir.VrmEx.Schema.Image{}],
            materials: [%Elixir.VrmEx.Schema.Material{}],
            meshes: [%Elixir.VrmEx.Schema.Mesh{}],
            nodes: [%Elixir.VrmEx.Schema.Node{}],
            samplers: [%Elixir.VrmEx.Schema.Sampler{}],
            scene: nil,
            scenes: [%Elixir.VrmEx.Schema.Scene{}],
            skins: [%Elixir.VrmEx.Schema.Skin{}],
            textures: [%Elixir.VrmEx.Schema.Texture{}]

  @type t() :: %__MODULE__{
          accessors: [Elixir.VrmEx.Schema.Accessor.t()],
          animations: [Elixir.VrmEx.Schema.Animation.t()],
          asset: nil,
          buffer_views: [Elixir.VrmEx.Schema.BufferView.t()],
          buffers: [Elixir.VrmEx.Schema.Buffer.t()],
          cameras: [Elixir.VrmEx.Schema.Camera.t()],
          extensions: nil,
          extensions_required: [String.t()],
          extensions_used: [String.t()],
          extras: nil,
          images: [Elixir.VrmEx.Schema.Image.t()],
          materials: [Elixir.VrmEx.Schema.Material.t()],
          meshes: [Elixir.VrmEx.Schema.Mesh.t()],
          nodes: [Elixir.VrmEx.Schema.Node.t()],
          samplers: [Elixir.VrmEx.Schema.Sampler.t()],
          scene: nil,
          scenes: [Elixir.VrmEx.Schema.Scene.t()],
          skins: [Elixir.VrmEx.Schema.Skin.t()],
          textures: [Elixir.VrmEx.Schema.Texture.t()]
        }

  use ExConstructor
end
