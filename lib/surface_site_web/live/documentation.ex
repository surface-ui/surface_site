defmodule SurfaceSiteWeb.Documentation do
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
        <section
          class="main-content columns"
          style="margin-top: 0px; margin-bottom: 0px; position: relative;"
        >
          <Sidebar />
          <div class="container column" style="background-color: #fff;">
            <div class="section" style="padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><.link navigate="/">Home</.link></li>
                  <li class="is-active"><a href="#">Documentation</a></li>
                </ul>
              </nav>

              <#Markdown>
                # Documentation

                Surface is a **server-side rendering** component library that allows developers to
                build **rich interactive user-interfaces**, writing minimal custom Javascript.

                Built on top of [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/) and its component API,
                Surface leverages the amazing Phoenix Framework to provide a **fast** and **productive** solution
                to build modern web applications.

                For installation instructions, please visit the [Getting Started](/getting_started) guide.

                ## Features

                  * **An HTML-centric** templating language.

                  * **Components as modules** - they can be stateless, stateful, renderless or compile-time.

                  * **Declarative properties** - explicitly declare the inputs (properties, slots and events) of each component, including live components.

                  * **Slots** - placeholders declared by a component that you can fill up with **custom content**.

                  * **Contexts** - allows a parent component to share data with its children without passing them as properties.

                  * **Scoped CSS** - allows defining CSS rules that are scoped by component avoiding conflicts between components styles and more.

                  * **Scoped JS hooks** - allows defining JS hooks in colocated `.hooks.js` files that are automatically loaded without extra setup.

                  * **Compile-time checking** for the templates, components and their properties, events, slots and many other validations.

                  * **Integration with editor/tools** for warnings/errors, syntax highlighting, jump-to-definition,
                    auto-completion (soon!) and more.

                ## How to use it?

                In order to have your templates automatically translated, you need to write the Surface code either wrapped in a `~F`
                sigil or in a `.sface` file.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <.link navigate="/getting_started">
                ← Getting Started
              </.link>
              <.link navigate="/template_syntax">
                Template Syntax →
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
