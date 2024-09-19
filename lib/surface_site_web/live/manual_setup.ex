defmodule SurfaceSiteWeb.ManualSetup do
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
                  <li><.link navigate="/getting_started">Getting Started</.link></li>
                  <li class="is-active"><a href="#">Usage with Phoenix templates</a></li>
                </ul>
              </nav>
              <#Markdown>
                ## Set up Surface manually

                In case you don't want to use `mix surface.init`, you can configure the project manually with
                the following steps.

                Update your `mix.exs`, adding the `:surface` compiler to the list of compilers:

                ```elixir
                def project do
                  [
                    ...,
                    compilers: Mix.compilers() ++ [:surface]
                  ]
                end
                ```

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

                To use Surface's built-in JS Interoperability, you need to:

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
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <.link navigate="/getting_started">
                ← Getting Started
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
