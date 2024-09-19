defmodule SurfaceSiteWeb.LayoutsAndDeadViews do
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
                  <li class="is-active"><a href="#">Layouts &amp; dead views</a></li>
                </ul>
              </nav>

              <#Markdown>
                ## Layouts & dead views

                You can use `sface` templates for regular controllers, views and layouts.

                If you're using Phoenix `>= v1.7`, all you have to do is:

                * Use a `.sface` file instead `.html.heex`.
                * Use the `embed_sface/1` macro instead of the `embed_templates/1`.
                * If you're converting an existing heex file, make sure you replace any `EEx/HEEx`
                  code interpolation with the proper Surface syntax. For instance, if you have `<%= @foo %>`, replace it
                  with `{@foo}`.

                ### Example

                For a typical `MyAppWeb.PageController` module, you should have a colocated `MyAppWeb.PageHTML` like:

                ```elixir
                defmodule MyAppWeb.PageHTML do
                  use MyAppWeb, :html

                  embed_sface "page_html/home.sface"
                end
                ```

                As for layouts, you usually want something like:

                ```elixir
                defmodule MyAppWeb.Layouts do
                  use MyAppWeb, :html

                  embed_sface("layouts/root.sface")
                  embed_sface("layouts/app.sface")
                end
                ```

                > **Note**: Currently, you need to call `embed_sface/1` for each individual template as
                > described in the example above.

                ## Older Phoenix versions

                To enable support for dead views in older Phoenix versions, you need to use the old `View` approach,
                by adding `use Surface.View, template: "lib/*your_app_web*/templates"` to the `view` function of
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
                code interpolation with the proper Surface syntax as mentioned in the last section.

                ### Enabling only in specific views

                If you want to make Surface templates available only on specific views, you can add a new function
                in `lib/your_app_web.ex`:

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
              <.link navigate="/js_interop">
                ← JS Interoperability
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
