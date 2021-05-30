defmodule SurfaceSiteWeb.TemplateSyntax do
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
                  <li class="is-active"><Link to="#" label="Template Syntax" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Template Syntax

                Alternatives to the `:for` and `:if` directives are provided in the shape of the `{#for}` and `{#if}` constructs.
                These constructs are useful when wrapping multiple elements.

                ## for/else

                ```elixir
                {#for item <- @items}
                  Item: {item}
                {#else}
                  No items
                {/for}
                ```

                ## If

                ```elixir
                {#if @value == 0}
                  <div class="equal">
                    Value {@value} is 0
                  </div>
                {#elseif @value > 0}
                  <div class="greater">
                    Value {@value} is greater than 0
                  </div>
                {#else}
                  <div class="lower">
                    Value {@value} is lower than 0
                  </div>
                {/if}
                ```
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
