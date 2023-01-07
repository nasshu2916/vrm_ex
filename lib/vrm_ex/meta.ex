defmodule VrmEx.Meta do
  @type meta :: map()

  @spec meta(VrmEx.t()) :: meta()
  def meta(%{json_data: %{"extensions" => %{"VRM" => %{"meta" => meta}}}}) do
    meta
  end

  def meta(%{json_data: %{"extensions" => %{"VRMC_vrm" => %{"meta" => meta}}}}) do
    meta
  end

  @spec thumbnail_index(meta()) :: non_neg_integer()
  def thumbnail_index(%{"texture" => index}) do
    index
  end

  def thumbnail_index(%{"thumbnailImage" => index}) do
    index
  end
end
