defmodule SurfaceSiteWeb.Sidebar do
  use Surface.Component

  alias SurfaceSiteWeb.SidebarMenu

  def render(assigns) do
    ~H"""
    <aside
      class="section column is-narrow is-narrow-mobile is-fullheight is-hidden-mobile"
      style="background-color: #f5f5f5;"
    >
      <SidebarMenu />
    </aside>
    """
  end
end
