defmodule SurfaceSiteWeb.Events do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Raw, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

  def render(assigns) do
    ~H"""
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
                  <li class="is-active"><Link to="#" label="Events" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Events

                Phoenix Liveview supports DOM element bindings for client-server interaction. This allows developers
                to create server-side components that can react to client-side events triggered by the user.

                For a complete guide on Bindings, see the [Phoenix's Bindings Guide](https://hexdocs.pm/phoenix_live_view/bindings.html).

                ## Handling events in LiveView (without Surface)

                In Phoenix LiveView, when dispatching events in live components,
                the default target is the parent live view, not the component itself. If you need
                to handle events locally, you usually need to:

                  * Set the `phx-[event]` attributes on the elements which events need to be listened to.

                  * Set the `phx-target` attribute on those same elements to indicate that you want to
                    handle them locally.

                This can be non-intuitive, especially if you're coming from any existing component-based
                library like **React** or **Vue.js**.

                > **Note**: The main reason behind this design choice, as explained by José Valim in this
                  [discussion](https://github.com/phoenixframework/phoenix_live_view/pull/551#issuecomment-572084368),
                  is that, when using Phoenix templates, it's impossible to know what is the parent and what is
                  the child. There's no way to retrieve that information since templates are not treated as structured
                  code, they are just text.

                Here's the `Counter` example used in the [Data](/data) section, but this
                time using **Phoenix templates**:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  {{ live_component(@socket, SurfaceSiteWeb.Events.PhoenixCounter.Counter, id: "phoenix_counter") }}
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Counter</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Phoenix</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">mount</span>(socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:ok, assign(socket, count: <span style="color: rgb(181, 206, 168);">0</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~L&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">h1</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"title"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(86, 156, 214);">&lt;%=</span> <span style="color: rgb(156, 220, 254);">@count</span> <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">h1</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">phx-click</span>=<span style="color: rgb(206, 145, 120);">"dec"</span> <span style="color: rgb(156, 220, 254);">phx-target</span>=<span style="color: rgb(206, 145, 120);">"&lt;%= @myself %&gt;"</span><span style="color: rgb(128, 128, 128);">&gt;</span>-<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">phx-click</span>=<span style="color: rgb(206, 145, 120);">"inc"</span> <span style="color: rgb(156, 220, 254);">phx-target</span>=<span style="color: rgb(206, 145, 120);">"&lt;%= @myself %&gt;"</span><span style="color: rgb(128, 128, 128);">&gt;</span>+<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-danger"</span> <span style="color: rgb(156, 220, 254);">phx-click</span>=<span style="color: rgb(206, 145, 120);">"reset"</span> <span style="color: rgb(156, 220, 254);">phx-target</span>=<span style="color: rgb(206, 145, 120);">"&lt;%= @myself %&gt;"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Reset<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"inc"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :count, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> + <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"dec"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :count, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> - <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"reset"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, assign(socket, :count, <span style="color: rgb(181, 206, 168);">0</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Handling events in Surface

                Instead of treating templates as plain text, Surface parses the code identifying
                its structure (the hierarchy of components) and uses that information to
                restore the initially desired behaviour of handling events in LiveView. Bear in mind
                that in order to keep the behaviour consistent and predictable across multiple components,
                you should:

                  * always use the `:on-[event]` directive.
                  * always declare event properties as `:event`

                > **Note**: You can still use Phoenix's built-in `phx-[event]` directly if you want,
                however, if you need to pass that event as a property, you should declare that property as
                `:string` instead of `:event`.

                ### The `:on-[event]` directive

                Let's rewrite our example again using Surface's `:on-click` directive:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.SurfaceCounter.Counter id="surface_counter" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Counter</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">count</span>, :integer, default: <span style="color: rgb(181, 206, 168);">0</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">h1</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"title"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@count</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">h1</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"dec"</span><span style="color: rgb(128, 128, 128);">&gt;</span>-<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"inc"</span><span style="color: rgb(128, 128, 128);">&gt;</span>+<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-danger"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"reset"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Reset<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  </div><div>    <span style="color: rgb(106, 153, 85);"># Event handlers</span></div><div>    ...</div><div>  <span style="color: rgb(197, 134, 192);">end</span>    </div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                As you can see, we didn't have to define `phx-target` for any of the buttons. Sweet!

                Another great thing about Surface's approach is that it makes passing events as properties
                also more intuitive. Using phoenix templates, unless you always pass both, the event and the target,
                you cannot be sure where the event will be handled. You need to know upfront if there's a `phx-target`
                defined for that DOM element inside that component.

                Using Surface, the event is **always** passed along with the related target, assuming,
                by default, that the target is the caller component/view. This should cover most of the
                cases you have to face when working with events. In the rare cases when you need to handle the
                event somewhere else, you can explicitly pass the target, e.g., `click={{ "click", target: "#target_id" }}`.
                If you want the target to be the parent LiveView, you can set the target option as `:live_view`.

                > **Note**: The complete list of available events, as well as other types of bindings, can be found at
                section [Bindings](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-bindings)
                in the Phoenix LiveView's docs.
              </#Markdown>

              <#Markdown>

                ### Pass event through an `event` property

                In the above examples the events have been handled by the component itself.
                Sometime the component does not know how to handle an event and you would like to handle this event in the parent component.
                For that kind of use case, you must declare the event in the child component by using the `prop` macro defining the type as `:event`,
                and pass the value of that prop to the `:on-[event]` directive.

                > _**prop** name, :event, options_

                Where:

                  * `name` - is the name of the event.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the event as required. Default is `false`.
                  * `default` - defines a default value for an optional event that will be handled by the component.

                ### Stateless component
                The simplest case you need to pass an event is when you create a stateless component that includes an element
                that defines a server binding (event). Since the component is stateless, it cannot handle the event by itself
                so it needs to receive the event handler as a prop.

                For example, imagine a `Button` stateless component that raises an event when the user clicks on it.
                In the following example, we create that kind of component.
                As you can see in the example, we use twice the button component with two different handling functions that have been defined in the parent live view.
              </#Markdown>
              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.LiveButton id="surface_counter_2" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                  <pre class="hljs" style="display: block; overflow-x: auto; background: rgb(47, 30, 46) none repeat scroll 0% 0%; color: rgb(163, 158, 155); padding: 0.5em;"><span class="hljs-class"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">defmodule</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">Button</span></span> <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">use</span> Surface.Component

    prop label, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">:string</span>
    prop click, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">:event</span>, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">required:</span> <span class="hljs-keyword" style="color: rgb(129, 91, 164);">true</span>
    slot default

    <span class="hljs-function"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">def</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">render</span></span>(assigns) <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    ~H<span class="hljs-string" style="color: rgb(72, 182, 133);">""</span><span class="hljs-string" style="color: rgb(72, 182, 133);">"
    &lt;button type="</span>button<span class="hljs-string" style="color: rgb(72, 182, 133);">" :on-click={{ @click }}&gt;
      &lt;slot&gt;{{ @label }}&lt;/slot&gt;
    &lt;/button&gt;
    "</span><span class="hljs-string" style="color: rgb(72, 182, 133);">""</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span></pre>
                  </#Raw>
                  <#Raw>
                  <pre class="hljs" style="display: block; overflow-x: auto; background: rgb(47, 30, 46) none repeat scroll 0% 0%; color: rgb(163, 158, 155); padding: 0.5em;"><span class="hljs-class"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">defmodule</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">SurfaceSiteWeb</span></span>.Events.LiveButton <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">use</span> Surface.LiveComponent
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">alias</span> __MODULE_<span class="hljs-number" style="color: rgb(249, 155, 21);">_</span>.Button

    data status, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">:string</span>, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">default:</span> <span class="hljs-string" style="color: rgb(72, 182, 133);">"Not clicked :("</span>

    <span class="hljs-function"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">def</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">render</span></span>(assigns) <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    ~H<span class="hljs-string" style="color: rgb(72, 182, 133);">""</span><span class="hljs-string" style="color: rgb(72, 182, 133);">"
    &lt;div&gt;
    &lt;p&gt;Status: {{ @status }}&lt;/p&gt;
    &lt;Button label="</span>Click!<span class="hljs-string" style="color: rgb(72, 182, 133);">" click="</span>clicked<span class="hljs-string" style="color: rgb(72, 182, 133);">" /&gt;
    &lt;Button label="</span>Reset<span class="hljs-string" style="color: rgb(72, 182, 133);">" click="</span>reset<span class="hljs-string" style="color: rgb(72, 182, 133);">" /&gt;
    &lt;/div&gt;
    "</span><span class="hljs-string" style="color: rgb(72, 182, 133);">""</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span>

    <span class="hljs-function"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">def</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">handle_event</span></span>(<span class="hljs-string" style="color: rgb(72, 182, 133);">"clicked"</span>, <span class="hljs-number" style="color: rgb(249, 155, 21);">_</span>, socket) <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    {<span class="hljs-symbol" style="color: rgb(72, 182, 133);">:noreply</span>, assign(socket, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">:status</span>, <span class="hljs-string" style="color: rgb(72, 182, 133);">"Clicked!"</span>)}
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span>

    <span class="hljs-function"><span class="hljs-keyword" style="color: rgb(129, 91, 164);">def</span> <span class="hljs-title" style="color: rgb(254, 196, 24);">handle_event</span></span>(<span class="hljs-string" style="color: rgb(72, 182, 133);">"reset"</span>, <span class="hljs-number" style="color: rgb(249, 155, 21);">_</span>, socket) <span class="hljs-keyword" style="color: rgb(129, 91, 164);">do</span>
    {<span class="hljs-symbol" style="color: rgb(72, 182, 133);">:noreply</span>, assign(socket, <span class="hljs-symbol" style="color: rgb(72, 182, 133);">:status</span>, <span class="hljs-string" style="color: rgb(72, 182, 133);">"Not clicked :("</span>)}
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span>
    <span class="hljs-keyword" style="color: rgb(129, 91, 164);">end</span>
    </pre>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ### Stateful component
                In some case, you want to have a default behaviour that is handled by the component itself and you want to let the developer overrides the default implementation with a custom one. To implement a default behaviour, the component must implement an `handle_event/3` function, and so it requires to be stateful.

                One example is a generic stateful `Dialog` component with a close button like the one implemented in the `Stateless` section.
                By default, if the user click the "close" button, it will close the modal, however, if you're using the dialog to show a form
                that the user must fill in lots of information, you might want to confirm if the user really wants to close it and ask for confirmation.
                Something like: "Are you sure you want to close this form? All information provided will be lost.".
                To allow something like this, you need to have a default local implementation that just closes the dialog
                but this implementation can be overridden by the parent if it passes a custom implementation that, in our case, asks for confirmation before closing it.
              </#Markdown>
              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithDefaultBehaviour id="event_default_dialog_example" />
                  <br />
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithOverwrittenBehaviour id="event_overwritten_dialog_example" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    CODE
                  </#Raw>
                </footer>
              </div>
              <#Markdown>
                As you can see in the example, the stateless `Button` component that raises the event is used by the stateful `Modal` component that implements the default ways to handle the `ok` and the `close` events.

                Now if you want to change the default behaviour of closing the dialog automatically, all you have to do is pass that custom event using the `close` prop.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/data">
                ← Data
              </LiveRedirect>
              <LiveRedirect to="/slots">
                Slots →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
