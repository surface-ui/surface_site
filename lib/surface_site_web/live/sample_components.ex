defmodule SurfaceSiteWeb.SampleComponents do
  use Surface.LiveView

  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar

  data component, :string

  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, :component, params["component"])}
  end

  def render(assigns) do
    ~F"""
    <div style="position: relative;">
      <MobileSidebar />
      <div class="sidebar-bg" />
      <div class="container is-fullhd">
        <section class="main-content columns">
          <Sidebar />
          <div class="container column" style="background-color: #fff;">
            <div class="section" style="padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><.link navigate="/">Home</.link></li>
                  <li :if={@component == nil} class="is-active">
                    <a href="#">Sample UI Components</a>
                  </li>
                  <li :if={@component != nil}>
                    <.link navigate="/samplecomponents">Sample UI Components</.link>
                    <li class="is-active">
                      <a href="#">{@component}</a>
                    </li>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="section">
              {route(assigns)}
            </div>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp route(%{component: nil} = assigns) do
    ~F"""
    <SurfaceSiteWeb.SampleComponents.Index id="index" />
    """
  end

  defp route(%{component: "Button"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.SampleComponents.ButtonInfo id="ButtonInfo" />
    """
  end

  defp route(%{component: "Table"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.SampleComponents.TableInfo id="TableInfo" />
    """
  end

  defp route(%{component: "Tabs"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.SampleComponents.TabsInfo id="TabsInfo" />
    """
  end

  defp route(assigns) do
    ~F"""
    No documentation for component <strong>{@component}</strong> defined.
    """
  end
end
