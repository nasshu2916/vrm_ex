defmodule VrmEx do
  @moduledoc """
  Documentation for `VrmEx`.
  """
  alias VrmEx.Loader

  def load(iodata, _opts \\ []) do
    iodata
    |> IO.iodata_to_binary()
    |> Loader.load()
  end
end
