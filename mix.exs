defmodule VrmEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :vrm_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_json_schema, "~> 0.9.2"},
      {:exconstructor, git: "https://github.com/nasshu2916/exconstructor.git"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:jason, "~> 1.4"},
      {:mime, "~> 2.0"}
    ]
  end
end
