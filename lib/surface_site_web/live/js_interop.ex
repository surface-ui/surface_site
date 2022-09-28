defmodule SurfaceSiteWeb.JSInterop do
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
                  <li class="is-active"><Link to="#" label="JS Interoperability" /></li>
                </ul>
              </nav>
              <#Markdown>
                # JS Interoperability

                For a better development experience, you can configure Surface to **automatically load
                JS hooks** related to your components when a colocated `.hooks.js` file is provided.

                This section assumes you already have basic knowledge of using JS hooks with LiveView.
                In case you don't, please read [JavaScript interoperability](https://hexdocs.pm/phoenix_live_view/js-interop.html)
                for general guidance.

                ## Usage

                Create a colocated `.hooks.js` file with the same base name of the component.

                Example:

                ```
                my_app_web/components
                ├── ...
                ├── card.ex
                ├── card.hooks.js
                ```

                Export your hook as `default` in `card.hooks.js`:

                ```js
                export default {
                  mounted(){
                    console.log("Card mounted")
                  }
                }
                ```

                Use the `:hook` directive to bind the hook to the HTML element:

                ```surface
                <div id="my_div" :hook>
                  ...
                </div>
                ```

                > Hooks require a unique ID on each element.

                ### Defining multiple hooks

                If you need to bind more than one hook to different elements in you HTML, you
                can export multiple hooks:


                ```js
                let Card = {
                  mounted(){
                    console.log("Card mounted")
                  }
                };

                let OtherHook = {
                  mounted(){
                    console.log("OtherHook mounted")
                  }
                };

                export {Card, OtherHook};
                ```

                Then use the `:hook` directive passing the name of each hook related to each element:

                ```surface
                <div :hook="Card">
                  ...
                  <div :hook="OtherHook">
                </div>
                ```

                You can also access hooks defined by other components using the `:from` option:

                ```surface
                <div :hook={"Card", from: MyComponents.CardList}>
                  ...
                </div>
                ```

                ## Choosing a different output dir

                By default, Surface builds all components' JS files into `./assets/js/_hooks/`.
                It you need the compiler use a different folder, you can set the `hooks_output_dir`
                configuration in your `config/dev.exs`. Example:

                ```elixir
                config :surface, :compiler, hooks_output_dir: "assets/js/surface"
                ```
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/testing">
                ← Testing
              </LiveRedirect>
              <LiveRedirect to="/scoped_css">
                Scoped CSS →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
