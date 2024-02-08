import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :surface_site, SurfaceSiteWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qick86rrt0cZHQpbf7BLKywNWLsT9FUWpg/f//xOmOw6ZD/rVBUd+f0KMzEw0jI+",
  server: false

# In test we don't send emails.
config :surface_site, SurfaceSite.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
