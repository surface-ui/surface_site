defmodule SurfaceSiteWeb.Testing do
  use Surface.LiveView

  alias Surface.Components.Markdown
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar

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
                  <li><.link navigate="/documentation">Documentation</.link></li>
                  <li class="is-active"><a href="#">Testing</a></li>
                </ul>
              </nav>
              <#Markdown>
                # Testing

                For convenience, Surface provides a [render_surface/1](https://hexdocs.pm/surface/Surface.LiveViewTest.html#render_surface/1)
                macro that allows developers to test component's markup directly. You should use this macro
                whenever testing regular rendering of stateless components or live components that **don't
                require a parent live view** during tests.

                ## Example

                ```elixir
                # Import conveniences for testing
                use Surface.LiveViewTest

                # The default endpoint for testing
                @endpoint Endpoint

                test "creates a <button> with class" do
                  html =
                    render_surface do
                      ~F"\""
                      <Button class="btn">
                        Ok
                      </Button>
                      "\""
                    end

                  assert html =~ "\""
                        <button type="button" class="btn">
                          Ok
                        </button>
                        "\""
                end
                ```
                {: show_line_numbers=true}

                ## Initializing assigns

                You can initialize any assign you need by defining an `assigns` variable before calling `render_surface/1`:

                ```elixir
                test "creates a <button> with class" do
                  assigns = %{class: "btn"}

                  html =
                    render_surface do
                      ~F"\""
                      <Button class={@class}>
                        Ok
                      </Button>
                      "\""
                    end

                  assert html =~ "\""
                         <button type="button" class="btn">
                           Ok
                         </button>
                         "\""
                end
                ```
                {: show_line_numbers=true selected_lines="2"}

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
              <.link navigate="/contexts">
                ← Contexts
              </.link>
              <.link navigate="/js_interop">
                JS Interoperability →
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
