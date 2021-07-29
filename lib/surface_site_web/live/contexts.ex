defmodule SurfaceSiteWeb.Contexts do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar
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
                  <li class="is-active"><Link to="#" label="Contexts" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Contexts

                Sometimes you need to initialize some kind of context before using a component. For instance,
                when working with forms in Phoenix templates, you usually need to define a form variable that
                can be passed to form elements along with each field name. Here's an example:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Contexts.Example01.ExamplePhoenix id="example_01_phoenix" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="html"
                    module={SurfaceSiteWeb.Contexts.Example01.ExamplePhoenix}
                    line_range={57..72}
                  />
                </footer>
              </div>

              <#Markdown>
                Using Surface contexts, you can improve the developer experience by not forcing one to
                pass the **form** and **field** values multiple times. Instead, you can store those
                values in the **context** and retrieve them in the child component when needed.

                > **Note**: Although storing values in contexts might be an interesting way to
                avoid **"Property drilling"**, you must use them carefully. Overusing them will make
                your code less explicit, which may lead to components that are harder to reason
                about.

                Here's the updated version of our form now using components and contexts:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Contexts.Example01.Example id="example_01" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="surface"
                    module={SurfaceSiteWeb.Contexts.Example01.Example}
                    line_range={198..205}
                  />
                </footer>
              </div>

              <#Markdown>
                ## Using `<Context>`

                You can `put` or `get` values to/from the context using the `Context` component.

                ### Putting values into the context

                Let's take a look at our `Form` component.
              </#Markdown>

              <#Code language="elixir" module={SurfaceSiteWeb.Contexts.Example01.Form} line_range={104..129} />

              <#Markdown>
                The value of variable `form` will be stored in the context under the key `:form` and will be
                available to any child component inside `<Context>...</Context>`, including any instance present
                in the content assigned to the "default" slot.

                We can use the same concept in our `Field` component and add the field name to the context too:
              </#Markdown>

              <#Code language="elixir" module={SurfaceSiteWeb.Contexts.Example01.Field} line_range={131..162} />

              <#Markdown>
                ### Retrieving values from the context

                Now that we have both values, `form` and `field` properly stored in the context,
                the `TextInput` component can access those values and use them as need:
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Contexts.Example01.TextInput}
                line_range={164..181}
              />

              <#Markdown>
                ## Scoping context values

                One important thing to keep in mind it that storing values from different components
                might lead to naming conflicts. To avoid that, Surface allows you to "namespace" the
                values stored using an extra scope key.

                The key is just an `atom` and can usually be the component's module. For instance:

                Instead of:

                ```surface
                <Context put={form: form}>
                ```

                you can use:

                ```surface
                <Context put={__MODULE__, form: form}>
                ```

                That would create a composite key containing both atoms, i.e. `{Form, :form}` for that value.

                Now, whenever you need to retrieve the value, you must pass the scope too:

                ```surface
                <Context get={Form, form: f}>
                ```

                > **Note:** If you want to distribute a library that store values into the context,
                it's highly recommended that you **always** scope those values as demonstrated. This way
                you make sure it can play nicely with other libraries that also use contexts.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/state_management">
                ← State Management
              </LiveRedirect>
              <LiveRedirect to="/testing">
                Testing →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
