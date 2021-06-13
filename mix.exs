defmodule SurfaceSite.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_site,
      version: "0.1.0",
      elixir: "~> 1.8",
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
      {:phoenix, "~> 1.5.0"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:plug_cowboy, "~> 2.1"},
      {:ecto, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:jason, "~> 1.0"},
      {:surface, github: "surface-ui/surface", override: true},
      {:surface_markdown, github: "surface-ui/surface_markdown", branch: "surface-next"},
      {:surface_formatter, github: "surface-ui/surface_formatter", branch: "support-new-surface-syntax"},
      {:earmark, "~> 1.3"},
      {:html_entities, "~> 0.4"},
      {:phoenix_ecto, "~> 4.2"},
      {:floki, ">= 0.30.0", only: :test}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
