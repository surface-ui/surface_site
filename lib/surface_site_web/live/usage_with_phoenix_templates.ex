defmodule SurfaceSiteWeb.UsageWithPhoenixTemplates do
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
                ## Usage with Phoenix templates

                Using Surface components in **vanilla Phoenix templates**, i.e. using `~H` or in `*.heex` files,
                is partially supported, however, this approach is limited and mostly not recommended.

                Keep in mind that Surface extends Liveview, adding extra features like contexts and Scoped CSS.
                Since there's **no built-in support** for them in Phoenix, Surface needs to prepare the LV/Component
                to make those features work seamlessly.

                If you find a Surface component you want to use in your existing phoenix project.
                You have the following options:

                1. **[Recommended]** Replace the live views (or components) that will use the desired component
                with their Surface's counterparts, i.e. `Surface.LiveView`, `Surface.LiveComponent` and `Surface.Component`.
                This requires no extra step and you'll be able to enjoy all its features without any limitation.

                2. **[Limited]** Follow the steps described in the [Setting up Phoenix views for Surface](/usage_with_phoenix_templates#setting-up-phoenix-views-for-surface)
                section below and use `~F` or `.sface` instead of `~H` and `.heex`. This should work fine but some features
                may require extra work like implementing `mount` to call `Surface.init(socket)`.

                3. **[Not Recommended]** Use `<YourSurfaceComponent.render/>` for function components and
                `<.live_component module={YourSufaceLiveComponent} .../>` for Live components. This can work for most simple components
                as long as they don't make use of any of Surface's exclusive features. Pay attention that other features that may be added
                in the future might not work with this approach either.

                ## Setting up Phoenix views for Surface

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
