defmodule SurfaceSiteWeb.Layouts do
  use SurfaceSiteWeb, :html

  embed_templates "layouts/*"
  embed_sface("layouts/root.sface")
  # embed_sface("layouts/app.sface")

  defp surface_version() do
    Application.spec(:surface, :vsn)
  end
end
