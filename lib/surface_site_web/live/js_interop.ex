defmodule SurfaceSiteWeb.JSInterop do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

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

                ## Setup

                Update `mix.exs`, adding the `:surface` compiler to the list of compilers:

                ```elixir
                def project do
                  [
                    ...,
                    compilers: [:phoenix] ++ Mix.compilers() ++ [:surface]
                  ]
                end
                ```

                Update `.gitignore`:

                ```elixir
                # Ignore auto-generated hook files
                /assets/js/_hooks/
                ```

                Update `assets/js/app.js`:

                ```js
                import Hooks from "./_hooks"
                // ...
                let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, ... })
                ```

                Update the Endpoint options in `config/dev.exs` for live reload of JS hooks:

                ```elixir
                config :my_app, MyAppWeb.Endpoint,
                  ...
                  reloadable_compilers: [:phoenix, :elixir, :surface],
                  live_reload: [
                    patterns: [
                      ~r"lib/my_app_web/(live|components)/.*(ex|js)$",
                      ...
                    ]
                ```

                ## Usage

                Create a colocated `.hooks.js` file with the same base name of the component.

                Example:

                ```
                my_app_web/components
                ├── ...
                ├── card.ex
                ├── card.hooks.js
                ```

                Export the hooks you need in `card.hooks.js`:

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

                Use the `:hook` directive to bind whatever hook you need:

                ```surface
                <div :hook="Card">
                  ...
                </div>
                ```

                You can also access hooks defined by other components using option `:from`:

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
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
