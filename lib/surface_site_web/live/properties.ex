defmodule SurfaceSiteWeb.Properties do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar
  alias SurfaceSiteWeb.Components.Code

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
                  <li class="is-active"><Link to="#" label="Properties" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Properties

                You can pass information from a parent component down to a child using **properties**.

                In order to declare a property, you must use the `prop` macro:

                > _**prop** name, type, options_

                Where:

                  * `name` - is the name of the property.
                  * `type` - an atom defining the type of the property. See all available types in section ["Components Basics > Types available"](/components_basics#types-available).
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the property as required. Default is `false`.
                  * `default` - defines a default value for an optional property.
                  * `values` - the list or range of values suggested for the property.
                  * `values!` - the list or range of all possible values for the property. Unlike `values`, this
                    option enforces validation of the default value against the given list.
                  * `from_context` - if the prop is not passed or the value is `nil`, sets the value to the one
                    stored in the context under the given key.
                  * `accumulate` - instructs Surface to group all different values provided
                    for that property into a single list. Default is `false`, i.e. only the
                    last value is passed.
                  * `css_variant` - Tailwind only. If set to `true`, instructs the Surface compiler to generate
                    CSS variants based on the related assign's type and value. Default is `false`. For further information,
                    see ["Generating CSS variants "](/scoped_css#generating-css-variants-(tailwind-only)).

              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Properties.Example01.Example />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Properties.Example01.Example}
                    line_range={2..-3//-1}
                    show_line_numbers
                    selected_lines="7"
                  />
                </footer>
              </div>

              <#Markdown>
                ## CSS class property

                In order to avoid working with string concatenation, which is annoying and error-prone,
                Surface allows passing keyword lists directly to the `class` property and improves
                developer experience by automatically handling conditional classes.
                Let's see how it works.

                Imagine you want to create a button component that sets CSS classes based on the following
                rules:

                  * `button` - always set
                  * `is-info` - always set
                  * `is-loading` - set if `@loading` is truthy
                  * `is-rounded` - set if `@rounded` is truthy

                We can define our component like this:
              </#Markdown>

              <#Code language="elixir" module={SurfaceSiteWeb.Properties.Example02} line_range={2..17} />

              <#Markdown>
                Let's try it out.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Properties.Example02.Example id="example_02" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="surface"
                    module={SurfaceSiteWeb.Properties.Example02.Example}
                    line_range={28..30}
                  />
                </footer>
              </div>

              <#Markdown>
                > **Note:** For regular HTML tags like `<button>`, the `class` attribute will be handled automatically
                as expected. For custom components, you need to instruct Surface to do so by setting the type of the
                property as `:css_class`.

                ## Event property

                In order to declare an event property, you must use the `prop` macro and
                define the type as `:event`:

                > _**prop** name, **:event**, options_

                Where:

                  * `name` - is the name of the event.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the event as required. Default is `false`.
                  * `default` - defines a default value for an optional event.

                **Example:**
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Properties.Example03}
                line_range={2..-3//-1}
                show_line_numbers
                selected_lines="5"
              />
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/components_basics">
                ← Components Basics
              </LiveRedirect>
              <LiveRedirect to="/data">
                Data →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
