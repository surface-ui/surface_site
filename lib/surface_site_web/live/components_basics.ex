defmodule SurfaceSiteWeb.ComponentsBasics do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Raw, Markdown}
  alias SurfaceSiteWeb.Components.ComponentAPI
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

  def render(assigns) do
    ~H"""
    <div style="position: relative;">
      <MobileSidebar/>
      <div class="sidebar-bg"/>
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
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(106, 153, 85);"># Defining the component</span></div><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Hello</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      Hello, I'm a component!</div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div>  <span style="color: rgb(106, 153, 85);"># Using the component</span></div><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Hello</span><span style="color: rgb(128, 128, 128);"> /&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
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

                ## Using aliases

                Since a component is just a module, it can injected using either its full name
                or a valid `alias`.

                Using full module name:

                ```
                <MyProject.Components.MyButton>
                <MyProject.Components.MyLink>
                ```

                Using aliases:

                ```
                alias MyProject.Components.MyButton
                alias MyProject.Components.MyLink, as: Link

                def render(assigns) do
                  ...
                  <MyButton>
                  <Link>
                  ...
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

                Let's take a look a component can be defined using Surface's API.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div id=":2hn" class="Am Al editable LW-avf tS-tW" hidefocus="true" aria-label="Message Body" g_editable="true" role="textbox" aria-multiline="true" contenteditable="true" tabindex="1" style="direction: ltr; min-height: 580px;" itacorner="6,7:1,1,0,0" spellcheck="false"><div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The type (color) of the button"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">type</span>, :string, values: [<span style="color: rgb(206, 145, 120);">"primary"</span>, <span style="color: rgb(206, 145, 120);">"success"</span>, <span style="color: rgb(206, 145, 120);">"info"</span>]</div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The Button is expanded (full-width)"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">expanded</span>, :boolean, default: <span style="color: rgb(86, 156, 214);">false</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "Triggers on click"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">click</span>, :event</div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "Triggers on focus"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">focus</span>, :event</div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The content of the button"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">default</span>, required: <span style="color: rgb(86, 156, 214);">true</span></div><div>    </div><div>    ...</div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                The public API of the `Button` above can be automatically generated, including all
                information about **properties**, **slots** and **events**, divided by group in each
                individual tab as follows:
              </#Markdown>

              <ComponentAPI module={{SurfaceSiteWeb.ComponentsBasics.Example02.Button}}/>

              <#Markdown>
                ### Public vs private

                Using `property` and `slot` defines the public API of the component as their values
                are initialized outside the component. Assigns declared as `data` are considered
                private since they can only be accessed inside the component's scope.

                It's important to keep that distinction in mind when designing a new component. Remember that
                users need to be able to easily identify the public interface so they can properly interact with
                the component. The recommendation is to have everything explicitly declared and well documented
                using Surface's component API.

                ## Directives

                Directives are built-in attributes that can modify the translated code of a component at
                compile time. Currently, the following directives are supported:

                  * `:for` - Iterates over a list (generator) and renders the content of the tag (or component)
                    for each item in the list.

                  * `:if` - Conditionally render a tag (or component). The code will be rendered if the expression
                    is evaluated to a truthy value.

                  * `:show` - Conditionally shows/hides an HTML tag, keeping the rendered element in the DOM even
                    when the value is `false`.

                  * `:let` - Declares which slot props will be used in the current scope.

                  * `:props` - When defined in a component, it passes dynamic properties to it.
                    If defined in a `<slot>`, it passes slot props from the slot's scope to the associated content
                    that is being prepared to fill the slot. For more information see section "**Slots props**"
                    in the [Slots](/slots) documentation.

                  * `:attrs`- Passes dynamic attributes to any HTML tag.

                  * `:on-[event]` - Sets a `phx-*` event binding defining the component itself as the
                    default handler (target). This is the prefered way to use `phx` events in **Surface** as it can
                    properly handle properties of type `:event`. Available directives are: `:on-click`,
                    `:on-capture-click`, `:on-blur`, `:on-focus`, `:on-change`, `:on-submit`, `:on-keydown`,
                    `:on-keyup`, `:on-window-focus`, `:on-window-blur`, `:on-window-keydown` and `:on-window-keyup`.

                Here's an example using the `:for` directive:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">ul</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">li</span> <span style="color: rgb(156, 220, 254);">:for</span>=<span style="color: rgb(86, 156, 214);">{{</span> item &lt;- <span style="color: rgb(156, 220, 254);">@items</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(86, 156, 214);">{{</span> item.name <span style="color: rgb(86, 156, 214);">}}</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">li</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">ul</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                The `:for` directive will be responsible for injecting the
                necessary code to iterate over the list of items rendering each item's name.

                ### Modifiers

                Directives can also have modifiers that allow users to customize their behaviour.

                For instance, the `:for` directive has two modifiers, `index` and `with_index`. Both
                are mostly used when rendering named slots:

                Using `index`:
              </#Markdown>

              Example 1
              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">td</span> <span style="color: rgb(156, 220, 254);">:for.index</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@cols</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"cols"</span> <span style="color: rgb(156, 220, 254);">index</span>=<span style="color: rgb(86, 156, 214);">{{</span> index <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">td</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              Example 2

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                  <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">td</span> <span style="color: rgb(156, 220, 254);">:for.index</span>=<span style="color: rgb(86, 156, 214);">{{</span> i &lt;- <span style="color: rgb(156, 220, 254);">@cols</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"cols"</span> <span style="color: rgb(156, 220, 254);">index</span>=<span style="color: rgb(86, 156, 214);">{{</span> i <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">td</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Using `with_index`:

              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">td</span> <span style="color: rgb(156, 220, 254);">:for.with_index</span>=<span style="color: rgb(86, 156, 214);">{{</span> {col, i} &lt;- <span style="color: rgb(156, 220, 254);">@cols</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    Title: <span style="color: rgb(86, 156, 214);">{{</span> col.title <span style="color: rgb(86, 156, 214);">}}</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"cols"</span> <span style="color: rgb(156, 220, 254);">index</span>=<span style="color: rgb(86, 156, 214);">{{</span> i <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">td</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Interpolation

                In the example above, the `{{ item.name }}` instructs the compiler to inject
                the expression inside `{{ }}` into the generated code. Any valid expression is accepted.

                **Important note**: Pay attention that just like React, Surface does not allow incomplete
                expressions to be interpolated in the template. So something like:

              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                  <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(106, 153, 85);">&lt;!-- DON'T DO THIS!!! --&gt;</span></div><div>    </div><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(197, 134, 192);">if</span> <span style="color: rgb(156, 220, 254);">@condition</span> <span style="color: rgb(197, 134, 192);">do</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">span</span><span style="color: rgb(128, 128, 128);">&gt;</span>It's true!<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">span</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(197, 134, 192);">else</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">span</span><span style="color: rgb(128, 128, 128);">&gt;</span>It's false!<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">span</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(197, 134, 192);">end</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                it's not accepted and will throw a `compile error`. If you find yourself in a situation
                where you need to write this kind of code, try to create assigns/variables that represent
                the final state and use directives like `:if` or `:show` instead. You can also try to move
                the logic to a separate function. Having this type of conditionals inside
                your templates tends to pollute the code a lot and it's, in general, not recommended.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/documentation">
                ← Introduction
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
