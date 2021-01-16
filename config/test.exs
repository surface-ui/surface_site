use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :surface_site, SurfaceSiteWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :surface_site, SurfaceSite.Repo,
  username: "postgres",
  password: "postgres",
  database: "surface_site_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
