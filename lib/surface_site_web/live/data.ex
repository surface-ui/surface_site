defmodule SurfaceSiteWeb.Data do
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
                  <li class="is-active"><Link to="#" label="Data" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Data

                Stateful components like `Surface.LiveView` and `Surface.LiveComponent` hold
                their state in the socket's `assigns`. In **Surface**, those assigns are called
                **data assigns**.

                In order to declare a data assign, you must use the `data` function:

                > _**data** name, type, options_

                Where:

                  * `name` - is the name of the assign.
                  * `type` - an atom defining the type of the assign. See all available types in
                    section **"Properties > Property types"**.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `default` - defines a default value for the assign.
                  * `values` - the list of possible values for the assign.

                In the following example, we create a simple `Counter` component that has its state
                defined by a single assign named `count`. You can use the `-` and `+` buttons to
                decrement/increment the counter's value.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Data.Example01.Counter id="example01" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Counter</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">count</span>, :integer, default: <span style="color: rgb(181, 206, 168);">0</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">h1</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"title"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@count</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">h1</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"dec"</span><span style="color: rgb(128, 128, 128);">&gt;</span> - <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"inc"</span><span style="color: rgb(128, 128, 128);">&gt;</span> + <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"inc"</span>, <span style="color: rgb(106, 153, 85);">_value</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :count, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> + <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"dec"</span>, <span style="color: rgb(106, 153, 85);">_value</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :count, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> - <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                > **Note**: Since we defined a default value for `count`, we don't need to
                implement the `mount/1` callback to initialize it. All `data` assigns with
                default values will be automatically initialized by **Surface**.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/properties">
                ← Properties
              </LiveRedirect>
              <LiveRedirect to="/events">
                Events →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
