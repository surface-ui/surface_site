defmodule SurfaceSiteWeb.LayoutsAndDeadViews do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
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
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li><LiveRedirect label="Documentation" to="/documentation" /></li>
                  <li class="is-active"><Link to="#" label="Layouts & dead views" /></li>
                </ul>
              </nav>

              <#Markdown>
                ## Layouts & dead views

                You can use `sface` templates on regular controllers, views and layouts in your application.
                This can be useful if you have an existing application and want to start using Surface stateless components
                on **non-LiveView** pages that you already have.
                It can also be useful if you want to render Surface components on your layout templates such as `app.html.heex`,
                `root.html.heex` or `live.html.heex`.

                To enable that, add `use Surface.View, template: "lib/*your_app_web*/templates"` to the `view` function of
                your application on `lib/your_app_web.ex`:

                ```elixir
                defmodule YourAppWeb do
                  # ...
                  def view do
                    use Phoenix.View,
                      root: "lib/your_app_web/templates",
                      namespace: YourAppWeb

                    # ...

                    use Surface.View, root: "lib/your_app_web/templates"
                  end
                end
                ```

                To enable autoreload in dev mode, update `config/dev.exs`:

                ```elixir
                    patterns: [
                      # ...
                      ~r"lib/your_app_web/templates/.*(eex|sface)$"
                    ]
                ```

                Then, change the extension of your template files from `.html.heex` to `.sface`
                (e.g. `templates/your_app_web/page/index.sface`) and make sure you replace any `EEx/HEEx`
                code interpolation with the proper Surface syntax. For instance, if you have `<%= foo %>`, replace it
                with `{foo}`.

                ### Enabling only in specific views

                If you want to make Surface templates available only on specific views, you can add a new function
                on the `lib/your_app_web.ex`:

                ```elixir
                defmodule YourAppWeb do
                  # ...

                  def surface_view(options \\ []) do
                    [
                      view(options),
                      quote do
                        use Surface.View, root: "lib/your_app_web/templates"
                      end
                    ]
                  end

                  # ...
                end
                ```

                To enable on your specific views, replace `use YourAppWeb, :view` with `use YourAppWeb, :surface_view`.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/js_interop">
                ← JS Interoperability
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
