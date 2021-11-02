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

                ## Related Projects

                We are working on several related projects.

                #### Surface Formatter

                [Surface Formatter](https://github.com/surface-ui/surface_formatter) is a formatter for `~F` sigil blocks and `.sface` files.

                Add the library to the list of dependencies in your project's mix file and use the `mix surface.format` task.

                #### Surface Catalogue

                [Surface Catalogue](https://github.com/surface-ui/surface_catalogue) is a development playground for your `Surface` components with similar goals to the Javascript library [Storybook](https://storybook.js.org).

                #### Surface Bootstrap

                [Surface Bootstrap](https://github.com/surface-ui/surface_bootstrap) is a set of Bootstrap components implemented using the [Bootstrap CSS framework](https://getbootstrap.com/docs/5.0/getting-started/introduction/).

                #### Surface Bulma

                [Surface Bulma](https://github.com/surface-ui/surface_bulma) is a set of Bootstrap components implemented using the [Bulma CSS framework](https://bulma.io/).

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
