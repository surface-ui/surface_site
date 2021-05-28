defmodule SurfaceSiteWeb.ControlFlow do
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
                  <li class="is-active"><Link to="#" label="Control Flow" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Control Flow

                Alternatives to the `:for` and `:if` directives are provided in the shape of the `<For>` and `<If>` constructs.
                These constructs are useful when wrapping multiple elements.

                ## For

                ```elixir
                <For each={{ item <- @items }}>
                  <a href={{ item.to }}>{{ item.label }}</a>
                  <Icon name="cheveron_left" />
                </For>
                ```
                Properties: `each :generator, required: true` - The generator for the for expression.

                Slots: `default, required: true`

                ## If

                ```elixir
                <If condition={{ @display_link }}>
                  <Icon name="cheveron_left" />
                  <a href={{ @item.to }}>{{ @item.label }}</a>
                </If>
                ```
                Properties: `condition :boolean, required: true`

                Slots: `default, required: true`
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/contexts">
                ← Contexts
              </LiveRedirect>
              <LiveRedirect to="/testing">
                Testing →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
