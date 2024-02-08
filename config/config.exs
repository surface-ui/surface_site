# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

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
  {Surface.Components.Form.Label, default_class: "label"},
  {SurfaceSiteWeb.Contexts.Example01.Form, propagate_context_to_slots: true},
  {SurfaceSiteWeb.Contexts.Example01.Field, propagate_context_to_slots: true}
]

# Configures the endpoint
config :surface_site, SurfaceSiteWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: SurfaceSiteWeb.ErrorHTML, json: SurfaceSiteWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: SurfaceSite.PubSub,
  check_origin: true,
  live_view: [
    signing_salt: "eEXUz84u6QjVdwt4cgT1rDU12+C9NuDn"
  ]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# TODO: Tailwind
# Configure tailwind (the version is required)
# config :tailwind,
#   version: "3.3.2",
#   default: [
#     args: ~w(
#       --config=tailwind.config.js
#       --input=css/app.css
#       --output=../priv/static/assets/app.css
#     ),
#     cd: Path.expand("../assets", __DIR__)
#   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
