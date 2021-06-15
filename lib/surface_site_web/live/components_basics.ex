defmodule SurfaceSiteWeb.ComponentsBasics do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Components.ComponentAPI
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
                  <li class="is-active"><Link to="#" label="Components Basics" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Components Basics

                In order to create a new component you need to define a module and `use` one of
                the available component types:

                  * **Surface.Component** - A stateless component.
                  * **Surface.LiveComponent** - A live stateful component.
                  * **Surface.LiveView** - A wrapper component around `Phoenix.LiveView`.
                  * **Surface.MacroComponent** - A low-level component which is responsible
                    for translating its own content at compile time.

                Components instances can be injected in a template using the same notation as
                any other HTML tag.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.ComponentsBasics.Example01.Example />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.ComponentsBasics.Example01.Example}
                    line_range={2..-3}
                    show_line_numbers
                    selected_lines="20"
                  />
                </footer>
              </div>

              <#Markdown>
                ## Colocated templates

                In case you want to isolate all templating code into a separate file, you can create a `.sface`
                file using the same base name in the same directory of the related component or liveview.
                For instance:

                ```
                components
                ├── example.ex
                ├── example.sface
                ├── hello.ex
                └── hello.sface
                ...
                ```

                This way you can remove the implemented `render/1` altogether. Any defined assign or function
                will be available in the new template.

                > **Note:** Unlike EEX templates, which can be used with any kind of text file, Surface's templates
                already extend HTML. Therefore, they are named simply as `*.sface` instead of `*.html.sface`.

                ## Using aliases

                Since a component is just a module, it can injected using either its full name
                or a valid `alias`.

                Using full module name:

                ```surface
                <MyProject.Components.MyButton>
                <MyProject.Components.MyLink>
                ```

                Using aliases:

                ```elixir
                alias MyProject.Components.MyButton
                alias MyProject.Components.MyLink, as: Link

                def render(assigns) do
                  ~F"\""
                  <MyButton>Ok</MyButton>
                  ...
                  <Link>
                    ...
                  </Link>
                  "\""
                end
                ```

                ## The component API

                **Surface** provides built-in functions that should be used to declare the essential building
                blocks of any component:

                  * `prop` - Defines a **property** for the component.

                  * `data` - Defines a **data** assign for a stateful `LiveComponent` or `LiveView`. The set of all `data`
                    assigns represents the **state** of the component/view.

                  * `slot` - Defines a placeholder (**slot**) that can be filled up with **custom content**.

                All values declared using any of the above functions will be merged into the components `assigns`
                and will be available inside the template using the `@` prefix.

                Having everything explicitly declared brings a lot of benefits since all information provided
                can be used later for introspection allowing **Surface** to provide:

                * **Syntactic sugar on attributes definition** - e.g. CSS style classes.
                * **Improved API for events** - automatically setting `phx-target`.
                * **Compile-time checking** - validations of required properties, incompatible slots, etc.
                * **Integration with editor/tools** - for warnings/errors, syntax highlighting, jump-to-definition, auto-completion and more.
                * **Docs generation** - see the `Button` component below.

                Let's take a look at how a component can be defined using Surface's API.

                ```elixir
                defmodule Button do
                  use Surface.Component

                  @doc "The type (color) of the button"
                  prop type, :string, values: ["primary", "success", "info"]

                  @doc "The Button is expanded (full-width)"
                  prop expanded, :boolean, default: false

                  @doc "Triggers on click"
                  prop click, :event

                  @doc "Triggers on focus"
                  prop focus, :event

                  @doc "The content of the button"
                  slot default, required: true

                  ...
                end
                ```

                The public API of the `Button` above can be automatically generated, including all
                information about **properties**, **slots** and **events**, divided by group in each
                individual tab as follows:
              </#Markdown>

              <ComponentAPI module={SurfaceSiteWeb.ComponentsBasics.Example02.Button} />

              <#Markdown>
                ### Public vs private

                Using `property` and `slot` defines the public API of the component as their values
                are initialized outside the component. Assigns declared as `data` are considered
                private since they can only be accessed inside the component's scope.

                It's important to keep that distinction in mind when designing a new component. Remember that
                users need to be able to easily identify the public interface so they can properly interact with
                the component. The recommendation is to have everything explicitly declared and well documented
                using Surface's component API.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/template_syntax">
                ← Template Syntax
              </LiveRedirect>
              <LiveRedirect to="/properties">
                Properties →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
