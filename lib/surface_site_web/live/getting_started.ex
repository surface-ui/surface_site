defmodule SurfaceSiteWeb.GettingStarted do
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
                  <li class="is-active"><Link to="#" label="Getting Started" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Getting Started

                Start building **rich interactive user-interfaces**, writing minimal custom Javascript now.
                For a quick start, you can either add Surface to an existing Phoenix LiveView project or install it
                from scratch.

                ## Installing from scratch

                Phoenix v1.5 comes with built-in support for LiveView apps. You can create a new application with

                ```
                mix phx.new my_app --live
                ```

                Then add `surface` to the list of dependencies in `mix.exs`:

                ```elixir
                def deps do
                  [
                    {:surface, "~> 0.3.0"}
                  ]
                end
                ```

                If you're using `mix format`, make sure you add `surface` to the `import_deps`
                configuration in your `.formatter.exs` file:

                ```elixir
                [
                  import_deps: [:ecto, :phoenix, :surface],
                  ...
                ]
                ```

                To allow live reloading for `.sface` files, add the related patterns to the endpoint
                configuration in your `config/dev.exs`:

                ```elixir
                config : MyApp, MyAppWeb.Endpoint,
                live_reload: [
                  patterns: [
                    ...,
                    ~r"lib/my_app_web/live/.*(sface)$",
                  ]
                ]
                ```

                That's all!

                > **Note:** In case you want to add Surface to an existing Phoenix application that doesn't have
                LiveView properly installed, please see Phoenix Liveview's installation instructions at
                [hexdocs.pm/phoenix_live_view/installation.html](https://hexdocs.pm/phoenix_live_view/installation.html).

                ## Using Surface on plain Phoenix views (optional)

                In order to have `~H` available for any Phoenix view, add the following import to your web
                file in `lib/my_app_web.ex`:

                ```elixir
                # lib/my_app_web.ex

                ...

                def view do
                  quote do
                    ...
                    import Surface
                  end
                end
                ```

                You will also need to call `Surface.init/1` in the mount function:

                ```elixir
                defmodule PageLive do
                  use Phoenix.LiveView

                  def mount(socket) do
                    socket = Surface.init(socket)
                    ...
                    {:ok, socket}
                  end

                  ...
                end
                ```

                ```elixir
                defmodule NavComponent do
                  use Phoenix.LiveComponent

                  def mount(socket) do
                    socket = Surface.init(socket)
                    ...
                    {:ok, socket}
                  end

                  ...
                end
                ```

                ## Running the examples

                Most of the components used in this website as well the examples in the documentation
                are just thin wrappers around [Bulma](https://bulma.io){: target="_blank"} components.
                However, you can easily adapt any of the examples to any library of your preference or
                try them out with your own CSS styles.

                For a quick start with bulma, you can add the following line to your `root.html.leex`:

                ```html
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.0/css/bulma.min.css"/>
                ```

                or add it to the list of dependencies in `assets/package.json`:

                ```elixir
                "dependencies": {
                  "bulma": "0.8.0"
                }
                ```

                ## Tooling

                  * A **VS Code** extension that adds support for **syntax highlighting** is available at
                    [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=msaraiva.surface).

                  * Improved integration with [ElixirSense](https://github.com/elixir-lsp/elixir_sense)
                    to provide **auto-completion** is comming soon!
                </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect class="nav-prev-next-next" to="/documentation">
                Documentation →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
