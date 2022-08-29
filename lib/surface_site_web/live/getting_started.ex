defmodule SurfaceSiteWeb.GettingStarted do
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
                  <li class="is-active"><Link to="#" label="Getting Started" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Getting Started

                Start building **rich interactive user-interfaces**, writing minimal custom Javascript now.
                For a quick start, you can either add Surface to an existing Phoenix LiveView project or install it
                from scratch.

                ## Installation

                Phoenix v1.6 comes with built-in support for LiveView apps. You can create a new phoenix application with:

                ```
                mix phx.new my_app
                ```

                > **Note:** In case you want to add Surface to an existing Phoenix application that doesn't have
                LiveView properly installed, please see Phoenix Liveview's installation instructions at
                [hexdocs.pm/phoenix_live_view/installation.html](https://hexdocs.pm/phoenix_live_view/installation.html).

                Add `surface` to the list of dependencies in `mix.exs`:

                ```elixir
                def deps do
                  [
                    {:surface, "~> 0.7.4"}
                  ]
                end
                ```

                ## Configuring the project using `mix surface.init`

                After fetching the dependencies with `mix deps.get`, you can run the `surface.init` task to
                update the necessary files in your project.

                In case you want the task to also generate a sample component for you, use can use the `--demo` option.
                A liveview using the component will be available at the `/demo` route.

                Additionally, the task can also set up a [Surface Catalogue](https://github.com/surface-ui/surface_catalogue/)
                for your project using the `--catalogue` option. The catalogue will be available at `/catalogue`.

                > **Note:** When using the `--demo` and `--catalogue` options together, the task also generates two
                > catalogue examples and a playground for the sample component.

                ```
                mix surface.init --demo --catalogue
                ```

                Start the Phoenix server with:

                ```
                mix phx.server
                ```

                That's it! You can now access your application at http://localhost:4000.

                You can see the full list of options provided by `surface.init` running:

                ```
                mix help surface.init
                ```

                ## Configuring the project manually

                In case you don't want to use `mix surface.init`, you can configure the project manually with
                the following steps.

                If you're using `mix format`, make sure you add `surface` to the `import_deps` and set up
                surface's built-in formatter in your `.formatter.exs` file:

                ```elixir
                [
                  import_deps: [:phoenix, :surface],
                  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "{lib,test}/**/*.sface"],
                  plugins: [Surface.Formatter.Plugin]
                ]
                ```

                To allow live reloading for `.sface` files, add the related patterns to the endpoint
                configuration in your `config/dev.exs`:

                ```elixir
                config :my_app, MyAppWeb.Endpoint,
                live_reload: [
                  patterns: [
                    ...,
                    ~r"lib/my_app_web/live/.*(sface)$",
                  ]
                ]
                ```

                If you're using `Gettext` and you want to use the built-in `<ErrorTag>` component, you need to
                configure it in your `config.exs` so it can properly translate error messages using gettext. If you
                don't plan to use `ErrorTag`, you can skip this configuration.

                ```elixir
                config :surface, :components, [
                  {Surface.Components.Form.ErrorTag, default_translator: {MyAppWeb.ErrorHelpers, :translate_error}}
                ]
                ```

                ## Building components

                Surface offers drop-in replacement components for `Phoenix.LiveView` (`Surface.LiveView`),
                `Phoenix.Component` (`Surface.Component`), and `Phoenix.LiveComponent` (`Surface.LiveComponent`).

                Let's build our first `Surface.Component` and render it in a `Surface.LiveView`.

                Create a file called `example_component.ex` and place it in your `lib/my_app_web/components` folder, which
                should have been previously created by the `mix surface.init` task. In case you've configured your project
                manually, you can place it in `lib/my_app_web/live`.

                ```elixir
                # lib/my_app_web/components/example_component.ex

                defmodule MyAppWeb.Components.ExampleComponent do
                  use Surface.Component

                  slot default, required: true

                  def render(assigns) do
                    ~F"\""
                    <h1><#slot/></h1>
                    "\""
                  end
                end
                ```

                Create a file called `example_live.ex` and place it in your `lib/my_app_web/live` folder.

                ```elixir
                # lib/my_app_web/live/example_live.ex

                defmodule MyAppWeb.ExampleLive do
                  use Surface.LiveView

                  alias MyAppWeb.Components.ExampleComponent

                  def render(assigns) do
                    ~F"\""
                    <ExampleComponent>
                      Hi there!
                    </ExampleComponent>
                    "\""
                  end
                end
                ```

                Add a new route for our Liveview in your `router.ex`.

                ```elixir
                live "/example", ExampleLive
                ```

                You can now see your Liveview and Component in action at `http://localhost:4000/example`.

                ## Converting a `Phoenix.LiveView` to `Surface.LiveView`

                In case you want to migrate an existing `Phoenix.Liveview` to `Surface.Liveview`, replace
                the `use Phoenix.LiveView` (or `use YourApp, :live_view`) with `use Surface.Liveview` and
                replace the sigil from `~H/~L` with `~F`. If you're using colocated files, rename the extension
                from `.heex`/`.leex` to `.sface`.

                ## Integration with typical Phoenix project's macros (optional)

                By default, `Surface.LiveView`, `Surface.Component`, and `Surface.LiveComponent` do not make
                use of existing macros in `YourAppWeb`. Using these macros directly in your views will bypass
                the default `YourAppWeb, :live_view/:live_component/:component` macros that are generated by
                default in `Phoenix` apps (using the `phx.new --live` mix task). Consequently, using the `Surface`
                macros directly will not render the default layout nor will make use of any other setup done
                by the `:live_view` macro (ex. `aliases` or `imports`).

                If you want to use the same approach with Surface, you can either:

                - modify the existing `YourAppWeb, :live_view` macro to use `Surface.LiveView` in place of `Phoenix.LiveView`
                - or create a new macro for the explicit use of `Surface.LiveView` (ex. `:surface_view`)

                ```elixir
                defmodule YourAppWeb
                  ...

                  def surface_view do
                   quote do
                     use Surface.LiveView,
                       layout: {YourAppWeb.LayoutView, "live.html"}

                     unquote(view_helpers())
                   end
                 end
                 ...
                end

                defmodule YourAppWeb.ExampleLive
                  use YourAppWeb, :surface_view
                end
                ```

                Modifying the generated `:live_view` macro will result in wholesale adoption of `Surface.LiveView`
                throughout the project, while creating a new macro will require explicit adoption in your project views.

                ## Using Surface in layouts and dead views

                It is possible to use `sface` templates on regular controllers, views and layouts in your application.
                This can be useful if you have an existing application and want to start using Surface stateless components
                on non-LiveView pages that you already have.
                It can also be useful if you want to render Surface components on your layout templates such as `app.html.heex`,
                `root.html.heex` or `live.html.heex`.

                For more information, please visit
                [Layouts & dead views](/layouts_and_dead_views){: data-phx-link="redirect" data-phx-link-state="push"}.

                ## Using Surface with Phoenix templates (optional)

                Using Surface components in **vanilla** Phoenix templates is partially supported but usually
                **not recommended**. For more information, please visit
                [Usage with Phoenix templates](/usage_with_phoenix_templates){: data-phx-link="redirect" data-phx-link-state="push"}.

                ## Running the examples (optional)

                Most of the components used in the examples presented in this website are just thin wrappers around
                [Bulma](https://bulma.io){: target="_blank"} components.
                However, you can easily adapt any of the examples to any library of your preference or
                try them out with your own CSS styles.

                For a quick start with bulma, you can add the following line to your `root.html.leex`:

                ```html
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css"/>
                ```

                or add it to the list of dependencies in `assets/package.json`:

                ```js
                "dependencies": {
                  "bulma": "0.9.3"
                }
                ```

                ## Surface extends LiveView

                The `Surface` replacement components are wrappers around the respective `LiveView` components and extend their
                functionality. A more thorough understanding of how `LiveView` works and how it is integrated into a Phoenix
                project can be found at the [`Phoenix LiveView` documentation](https://hexdocs.pm/phoenix_live_view/).

                ## Migrating from `v0.5.x` to `v0.6.x`

                Surface `v0.6.x` relies on the Liveview features available since `v0.16`. The main change
                from the user perspective is that the stateless `Surface.Component` now is built on top of
                `Phoenix.Component` instead of `Phoenix.LiveComponent`. This means the `mount/1`, `preload/1`
                and `udpate/2` callbacks are no longer available. If you initialize any assign or compute
                any value using those callbacks, you need to replace them with one of the new
                [assign helpers](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#module-assigns).

                ## Migrating from `v0.4.x` to `v0.5.x`

                Surface `v0.5.0` introduces a new syntax which requires migrating components written in previous versions.
                In order to make the migration process as smooth as possible, Surface `v0.5.x` ships with a converter that
                can automatically translate the old syntax into the new one.

                Please see the [Migration Guide](https://github.com/surface-ui/surface/blob/main/MIGRATING.md) for details.

                ## Tooling

                  * A **VS Code** extension that adds support for **syntax highlighting** is available at
                    [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=msaraiva.surface).

                  * Improved integration with [ElixirSense](https://github.com/elixir-lsp/elixir_sense)
                    to provide **auto-completion** is coming soon!
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
