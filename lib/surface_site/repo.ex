defmodule SurfaceSite.Repo do
  use Ecto.Repo,
    otp_app: :surface_site,
    adapter: Ecto.Adapters.Postgres
end
