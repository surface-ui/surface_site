defmodule SurfaceSiteWeb.Documentation do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

  def render(assigns) do
    ~H"""
    <div style="position: relative;">
      <MobileSidebar/>
      <div class="sidebar-bg"/>
      <div class="container is-fullhd">
        <section class="main-content columns" style="margin-top: 0px; margin-bottom: 0px; position: relative;">
          <Sidebar />
          <div class="container column" style="background-color: #fff;">
            <div class="section" style="padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li class="is-active"><Link to="#" label="Documentation" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Documentation

                Surface is a **server-side rendering** component library that allows developers to
                build **rich interactive user-interfaces**, writing minimal custom Javascript.

                Built on top of [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/) and its new
                [LiveComponent](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveComponent.html), Surface
                leverages the amazing Phoenix Framework to provide a **fast** and **productive** solution to build
                modern web applications.

                For installation instructions, please visit the [Getting Started](/getting_started) guide.

                ## How does it work?

                Surface's custom compiler translates components defined in an extended HTML-like syntax
                into Elixir's Abstract Syntax Tree (AST). It also translates standard HTML nodes, allowing to
                extend their behaviour adding new features like syntactic sugar on attributes definition,
                directives, static validation and more.

                In order to have your code translated, you need to use the `~H` sigil when defining your templates.

                ## Features

                  * **An HTML-centric** templating language with built-in directives (`:for`, `:if`, ...) and
                    syntactic sugar for attributes (inspired by Vue.js).

                  * **Components as modules** - they can be stateless, stateful, renderless or compile-time.

                  * **Declarative properties** - explicitly declare the inputs (properties and events) of each component.

                  * **Slots** - placeholders declared by a component that you can fill up with **custom content**.

                  * **Contexts** - allows a parent component to share data with its children without passing them as properties.

                  * **Compile-time checking** of components and their properties, slots and many other validations.

                  * **Integration with editor/tools** for warnings/errors, syntax highlighting, jump-to-definition,
                    auto-completion (soon!) and more.

              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/getting_started">
                ← Getting Started
              </LiveRedirect>
              <LiveRedirect class="nav-prev-next-next" to="/components_basics">
                Components Basics →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
