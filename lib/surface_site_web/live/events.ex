defmodule SurfaceSiteWeb.Events do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Raw, Markdown}
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
                  <li class="is-active"><Link to="#" label="Events" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Events

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

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">MyButton</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "Triggers on click"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">click</span>, :event</div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      ...</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
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
                  <SurfaceSiteWeb.Events.SurfaceCounter.Counter id="surface_counter"/>
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
