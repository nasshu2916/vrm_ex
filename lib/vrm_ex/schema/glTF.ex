defmodule VrmEx.Schema.GlTF do
  @moduledoc """
  The root object for a glTF asset.
  """

  defstruct accessors: [],
            animations: [],
            asset: nil,
            buffer_views: [],
            buffers: [],
            cameras: [],
            extensions: nil,
            extensions_required: [],
            extensions_used: [],
            extras: nil,
            images: [],
            materials: [],
            meshes: [],
            nodes: [],
            samplers: [],
            scene: nil,
            scenes: [],
            skins: [],
            textures: []

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

  def new(map) do
    struct = super(map)

    %{
      struct
      | accessors: Enum.map(struct.accessors, &VrmEx.Schema.Accessor.new/1),
        animations: Enum.map(struct.animations, &VrmEx.Schema.Animation.new/1),
        buffer_views: Enum.map(struct.buffer_views, &VrmEx.Schema.BufferView.new/1),
        buffers: Enum.map(struct.buffers, &VrmEx.Schema.Buffer.new/1),
        cameras: Enum.map(struct.cameras, &VrmEx.Schema.Camera.new/1),
        images: Enum.map(struct.images, &VrmEx.Schema.Image.new/1),
        materials: Enum.map(struct.materials, &VrmEx.Schema.Material.new/1),
        meshes: Enum.map(struct.meshes, &VrmEx.Schema.Mesh.new/1),
        nodes: Enum.map(struct.nodes, &VrmEx.Schema.Node.new/1),
        samplers: Enum.map(struct.samplers, &VrmEx.Schema.Sampler.new/1),
        scenes: Enum.map(struct.scenes, &VrmEx.Schema.Scene.new/1),
        skins: Enum.map(struct.skins, &VrmEx.Schema.Skin.new/1),
        textures: Enum.map(struct.textures, &VrmEx.Schema.Texture.new/1),
        extensions: extensions_new(struct.extensions)
    }
  end

  defp extensions_new(extensions) do
    for {key, value} <- extensions, into: %{} do
      case key do
        "VRM" -> {:vrm, VrmEx.Schema.Vrm.new(value)}
        "VRMC_vrm" -> {:vrmc_vrm, VrmEx.Schema.VRMCVrm.new(value)}
        _ -> {key, value}
      end
    end
  end
end
