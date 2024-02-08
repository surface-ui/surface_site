defmodule SurfaceSiteWeb.Layouts do
  use SurfaceSiteWeb, :html

  alias Surface.Components.LiveRedirect

  embed_templates "layouts/*"
  embed_sface("layouts/root.sface")
  # embed_sface("layouts/app.sface")

  defp surface_version() do
    Application.spec(:surface, :vsn)
  end

end
