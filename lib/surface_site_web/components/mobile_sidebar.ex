defmodule SurfaceSiteWeb.Components.MobileSidebar do
  use Surface.Component

  alias SurfaceSiteWeb.SidebarMenu

  def render(assigns) do
    ~F"""
    <div id="mobile-sidebar" class="mobile-sidebar" :hook="MobileSidebar">
      <div class="sidebar-background" onclick="closeMobileSidebar()" style="display: none;" />
      <div class="sidebar-content is-fixed is-fullheight animated faster" style="display: none;">
        <section class="hero is-info">
          <div class="hero-body" style="padding: 2.3rem 1.5rem 2.5rem 1.5rem">
            <div class="container">
              <h1 class="title">
                <span>Surface UI</span>
              </h1>
              <h2 class="subtitle" style="margin-right: 30px">
                A component library for <strong>Phoenix</strong>
              </h2>
            </div>
          </div>
        </section>
        <SidebarMenu />
      </div>
    </div>
    """
  end
end
