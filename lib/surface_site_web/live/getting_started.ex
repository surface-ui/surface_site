defmodule SurfaceSiteWeb.GettingStarted do
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

                > **Note:** In case you want to add Surface to an existing Phoenix application that doesn't have
                LiveView properly installed, please see Phoenix Liveview's installation instructions at
                [hexdocs.pm/phoenix_live_view/installation.html](https://hexdocs.pm/phoenix_live_view/installation.html).

                Add `surface` to the list of dependencies in `mix.exs`:

                ```elixir
                def deps do
                  [
                    {:surface, "~> 0.5.1"}
                  ]
                end
                ```

                If you're using `mix format`, make sure you add `surface` to the `import_deps`
                configuration in your `.formatter.exs` file:

                ```elixir
                [
                  import_deps: [:ecto, :phoenix, :surface],
                  surface_inputs: ["{lib,test}/**/*.{ex,exs,sface}"],
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

                ## Integration

                We will assume that you already have LiveView already implemented in your project. (See the [`Phoenix LiveView` documentation](https://hexdocs.pm/phoenix_live_view/installation.html#content) for greater detail on how to accomplish this).

                A simple example migration from `Phoenix.LiveView` consists of the following steps.

                ### Ensure you have a LiveView available

                Ensure that you have `LiveView` configured correctly in your project by implementing a `live` route directed to a `LiveView`.

                ```elixir
                live "/", ExampleLive, :index
                ```

                Surface offers drop-in replacement components for `Phoenix.LiveView` (`Surface.LiveView`), `Phoenix.Component` (`Surface.Component`), and `Phoenix.LiveComponent` (`Surface.LiveComponent`).

                Let's create our first `Surface.Component` and render it in our `Surface.LiveView`.


                ### Create your first Surface.Component

                Create a module for your component. Similarly to a `Phoenix.LiveView` component, `Surface` supports co-locating templates within a sigil (`~F` rather than `~L/~H`) or a template file with the same file name and the extension (`.sface` rather than `.leex/.heex`).


                ```elixir
                defmodule MyAppWeb.Components.ExampleComponent do
                  use Surface.Component

                  slot default, required: true

                  def render(assigns) do
                    ~F"\""
                    <h1><#slot /></h1>
                    "\""
                  end

                  # Or omit the render function and create a file
                  # with the same filename as the component but with
                  # an `.sface` extension

                end
                ```

                ### Converting a Phoenix.LiveView to Surface.LiveView

                Change the macro in your `LiveView` from `Phoenix.LiveView` (or `YourApp, :live_view`) and the render sigil from `~H/~L` or your template extension from `.heex`/`.leex` to `.sface`.

                ```elixir
                defmodule MyAppWeb.ExampleLive do
                  # If you generated an app with mix phx.new --live,
                  # the line below would be: use MyAppWeb, :live_view

                  #  use Phoenix.LiveView
                  use Surface.LiveView

                  alias MyAppWeb.Components.ExampleComponent

                  def render(assigns) do
                  # ~H"\""
                    ~F"\""
                    <ExampleComponent>
                      Surface is Working!!!
                    </ExampleComponent>
                    "\""
                  end

                  # Or omit the render function and create a file
                  # with the same filename as the LiveView but with
                  # an `.sface` extension

                end
                ```

                ### Surface Extends LiveView

                The `Surface` replacement components are wrappers around the respective `LiveView` components and extend their functionality. A more thorough understanding of how `LiveView` works and how it is integrated into a Phoenix project can be found at the [`Phoenix LiveView` documentation](https://hexdocs.pm/phoenix_live_view/).


                ### Component Configurations

                Surface provides a set of built-in components that you can use in any project. Some of these components require configuration:

                The `ErrorTag` expects that you define a `default_translator` to translate form error messages.
                If you do not use the `ErrorTag` component you can skip this configuration.
                ```elixir
                config :surface, :components, [
                  {Surface.Components.Form.ErrorTag, default_translator: {MyAppWeb.ErrorHelpers, :translate_error}}
                ]
                ```

                That's all!

                ## Migrating from `v0.4.x` to `v0.5.x`

                Surface `v0.5.0` introduces a new syntax which requires migrating components written in previous versions.
                In order to make the migration process as smooth as possible, Surface `v0.5.x` ships with a converter that
                can automatically translate the old syntax into the new one.

                Please see the [Migration Guide](https://github.com/surface-ui/surface/blob/master/MIGRATING.md) for details.

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
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.0/css/bulma.min.css"/>
                ```

                or add it to the list of dependencies in `assets/package.json`:

                ```js
                "dependencies": {
                  "bulma": "0.8.0"
                }
                ```

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
