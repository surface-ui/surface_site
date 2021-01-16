defmodule SurfaceSiteWeb.BulmaComponents do
  use Surface.LiveView

  alias SurfaceSiteWeb.Sidebar
  alias Surface.Components.{LiveRedirect, Link}
  alias SurfaceSiteWeb.MobileSidebar

  data component, :string

  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, :component, params["component"])}
  end

  def render(assigns) do
    ~H"""
    <div style="position: relative;">
      <MobileSidebar/>
      <div class="sidebar-bg"/>
      <div class="container is-fullhd">
        <section class="main-content columns">
          <Sidebar />
          <div class="container column" style="background-color: #fff;">
            <div class="section" style="padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li :if={{ @component == nil }} class="is-active">
                    <Link to="#" label="UI Components" />
                  </li>
                  <li :if={{ @component != nil }}>
                    <LiveRedirect label="UI Components" to="/uicomponents" />
                    <li class="is-active">
                      <Link to="#" label={{ @component }} />
                    </li>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="section">
              {{ route(assigns) }}
            </div>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp route(%{component: nil} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BulmaComponents.Index id="index"/>
    """
  end

  defp route(%{component: "Button"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BulmaComponents.ButtonInfo id="ButtonInfo"/>
    """
  end

  defp route(%{component: "Table"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BulmaComponents.TableInfo id="TableInfo"/>
    """
  end

  defp route(%{component: "Tabs"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BulmaComponents.TabsInfo id="TabsInfo"/>
    """
  end

  defp route(assigns) do
    ~H"""
    No documentation for component <strong>{{ @component }}</strong> defined.
    """
  end
end
