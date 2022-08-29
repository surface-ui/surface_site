# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :surface_site, SurfaceSiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qdZaVqRjkIyGWZ50fXKWgziVNqwZTtBLxQiTxBHJpMGXJvDljm+oAEwq+4r+2R4y",
  render_errors: [view: SurfaceSiteWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: SurfaceSite.PubSub,
  check_origin: true,
  live_view: [
    signing_salt: "eEXUz84u6QjVdwt4cgT1rDU12+C9NuDn"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Surface components
config :surface, :components, [
  {Surface.Components.Markdown,
   default_class: "content markdown",
   default_opts: [
     smartypants: false,
     code_class_prefix: "language-",
     postprocessor: &SurfaceSiteWeb.Components.Markdown.post_processor/1
   ]},
  {Surface.Components.Form.TextInput, default_class: "input"},
  {Surface.Components.Form.Field, default_class: "field"},
  {Surface.Components.Form.TextArea, default_class: "textarea"},
  {Surface.Components.Form.Label, default_class: "label"}
]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.10",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
