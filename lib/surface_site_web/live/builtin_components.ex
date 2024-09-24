defmodule SurfaceSiteWeb.BuiltinComponents do
  use Surface.LiveView

  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar
  alias SurfaceSiteWeb.Components.ComponentInfo

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
                    <a href="#">Built-in Components</a>
                  </li>
                  <li :if={@component != nil}>
                    <.link navigate="/builtincomponents">Built-in Components</.link>
                  </li>
                  <li :if={@component != nil} class="is-active">
                    <a href="#">{component_label(@component)}</a>
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

  defp component_label("InputControls") do
    "Input Controls"
  end

  defp component_label(component) do
    component
  end

  defp route(%{component: nil} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.Index id="index" />
    """
  end

  defp route(%{component: "Link"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Link} />
    """
  end

  defp route(%{component: "LiveRedirect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.LiveRedirect} />
    """
  end

  defp route(%{component: "LivePatch"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.LivePatch} />
    """
  end

  defp route(%{component: "Component"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Dynamic.Component} />
    """
  end

  defp route(%{component: "LiveComponent"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Dynamic.LiveComponent} />
    """
  end

  defp route(%{component: "Markdown"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.MarkdownInfo id="MarkdownInfo" />
    """
  end

  defp route(%{component: "Raw"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.RawInfo id="RawInfo" />
    """
  end

  defp route(assigns) do
    ~F"""
    No documentation for component <strong>{@component}</strong> defined.
    """
  end
end
