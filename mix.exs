defmodule SurfaceSite.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_site,
      version: "0.1.0",
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers() ++ [:surface],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SurfaceSite.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:plug_cowboy, "~> 2.5"},
      {:ecto, "~> 3.7"},
      {:postgrex, ">= 0.0.0"},
      {:jason, "~> 1.3"},
      {:surface, "~> 0.7.4"},
      {:surface_markdown, "~> 0.4.0"},
      {:html_entities, "~> 0.5"},
      {:phoenix_ecto, "~> 4.4"},
      {:floki, ">= 0.32.0", only: :test}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
