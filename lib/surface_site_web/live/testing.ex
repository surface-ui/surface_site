defmodule SurfaceSiteWeb.Testing do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

  def render(assigns) do
    ~H"""
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
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li><LiveRedirect label="Documentation" to="/documentation" /></li>
                  <li class="is-active"><Link to="#" label="Testing" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Testing

                For convinience, Surface provides a [render_surface/1](https://hexdocs.pm/surface/Surface.LiveViewTest.html#render_surface/1)
                macro that allows developers to test component's markup directly. You should use this macro
                whenever testing regular rendering of stateless components or live components that **don't
                require a parent live view** during tests.

                ## Example
              </#Markdown>
    <pre><code>{{ example_01() }}</code></pre>
              <#Markdown>
                ## Initializing assigns

                You can initialize any assign you need by defining an `assigns` variable before calling `render_surface/1`:
              </#Markdown>
    <pre><code>{{ example_02() }}</code></pre>
              <#Markdown>
                ## Testing stateful components

                For tests depending on the existence of a parent live view, e.g. testing events on live
                components and its **side-effects**, you should use Phoenix's built-in
                [live/2](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html#live/2) or
                [live_isolated/3](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html#live_isolated/3).

                For a complete guide on testing LiveViews, including testing events, see
                [LiveView Testing](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveViewTest.html).
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/contexts">
                ← Contexts
              </LiveRedirect>
              <LiveRedirect to="/js_interop">
                JS Interoperability →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp example_01 do
    ~S'''
    # Import conveniences for testing
    use Surface.LiveViewTest

    # The default endpoint for testing
    @endpoint Endpoint

    test "creates a <button> with class" do
      html =
        render_surface do
          ~H"""
          <Button class="btn">
            Ok
          </Button>
          """
        end

      assert html =~ """
             <button type="button" class="btn">
               Ok
             </button>
             """
    end
    '''
  end

  defp example_02 do
    ~S'''
    test "creates a <button> with class" do
      assigns = %{class: "btn"}

      html =
        render_surface do
          ~H"""
          <Button class={{ @class }}>
            Ok
          </Button>
          """
        end

      assert html =~ """
             <button type="button" class="btn">
               Ok
             </button>
             """
    end
    '''
  end
end
