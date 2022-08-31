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

                > **Note:** When using the `--demo` and `--catalogue` options together, the task also generates
                > a couple of examples and a playground for the sample component.

                The `--layouts` option will replace the `.heex` layout files with equivalent `.sface` files and
                the `--tailwind` will set up TailwindCSS and use it in the layouts and demo.

                To see the full list of options you can run `mix help surface.init`.

                ```
                mix surface.init --demo --catalogue --layouts --tailwind
                ```

                Start the Phoenix server with:

                ```
                mix phx.server
                ```

                That's it! You can now access your application at http://localhost:4000.

                ## Configuring the project manually

                In case you don't want to use `mix surface.init`, please check our
                [Set up Surface manually](/manual_setup){: data-phx-link="redirect" data-phx-link-state="push"}
                section for instructions.

                ## Creating components

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

                ## Surface extends LiveView

                The `Surface` replacement components are wrappers around the respective `LiveView` components and extend their
                functionality. A more thorough understanding of how `LiveView` works and how it is integrated into a Phoenix
                project can be found at the [`Phoenix LiveView` documentation](https://hexdocs.pm/phoenix_live_view/).

                ## Tooling

                  * A **VS Code** extension that adds support for **syntax highlighting** is available at
                    [marketplace.visualstudio.com](https://marketplace.visualstudio.com/items?itemName=msaraiva.surface).

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
