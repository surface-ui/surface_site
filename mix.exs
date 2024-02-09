defmodule SurfaceSite.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_site,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      compilers: Mix.compilers() ++ [:surface]
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
      {:surface, "~> 0.11", github: "surface-ui/surface", override: true},
      {:phoenix, "1.7.10"},
      {:surface_markdown, "~> 0.6.1"},
      {:nimble_publisher, "~> 0.1.2"},
      {:html_entities, "~> 0.5"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:floki, ">= 0.30.0", only: :test},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      # TODO: Tailwind
      # {:tailwind, "~> 0.2.0", runtime: Mix.env() == :dev},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.1.1"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end

  defp aliases do
    [
      # TODO: Tailwind
      # setup: ["deps.get", "assets.setup", "assets.build"],
      # "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      # "assets.build": ["tailwind default", "esbuild default"],
      # "assets.deploy": ["tailwind default --minify", "esbuild default --minify", "phx.digest"]
      setup: ["deps.get"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
