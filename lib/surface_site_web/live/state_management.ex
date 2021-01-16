defmodule SurfaceSiteWeb.StateManagement do
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
                  <li class="is-active"><Link to="#" label="State management" /></li>
                </ul>
              </nav>

              <#Markdown>
                # State management

                When designing a new component, one decision that has to be made is **where to keep its state**.
                Phoenix LiveView provides different ways to handle state depending on the type of the component
                you're using.

                Let's take a closer look at each one of them.

                ## Functional components

                State management in functional components is quite simple. After all, there's no state to be
                managed. It works as just like a pure function. You define properties that will be merged into
                the `assings`, the `assigns` will be passed to the `render/1` function and that's it. You cannot
                define events that can change any of the assigned values. If you want to do that, you'll have to
                change the values passed as properties in the parent component, forcing the `render/1` function
                to be called again with the updated values.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Component</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">click</span>, :event</div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">kind</span>, :string, default: <span style="color: rgb(206, 145, 120);">"is-info"</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button </span><span style="color: rgb(86, 156, 214);">{{</span><span style="color: rgb(206, 145, 120);"> </span><span style="color: rgb(156, 220, 254);">@kind</span><span style="color: rgb(206, 145, 120);"> </span><span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(206, 145, 120);">"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@click</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Handling state with `LiveView`

                Consider the following Dialog component:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Dialog</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">title</span>, :string, required: <span style="color: rgb(86, 156, 214);">true</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">show</span>, :boolean, required: <span style="color: rgb(86, 156, 214);">true</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">hideEvent</span>, :event, required: <span style="color: rgb(86, 156, 214);">true</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(206, 145, 120);">"modal"</span>, "is-active": <span style="color: rgb(156, 220, 254);">@show</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-background"</span><span style="color: rgb(128, 128, 128);">&gt;&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">header</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-head"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">p</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-title"</span><span style="color: rgb(128, 128, 128);">&gt;</span><span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@title</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">p</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">header</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">section</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-body"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">section</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">footer</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-foot"</span> <span style="color: rgb(156, 220, 254);">style</span>=<span style="color: rgb(206, 145, 120);">"justify-content: flex-end"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(156, 220, 254);">click</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@hideEvent</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span>Ok<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">footer</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                The `Dialog` above is a stateless component, i.e. it doesn't own its state and all
                state handling must be done in the parent `LiveView` by:

                1. Defining a new `data` assign called `:show_dialog` to hold the state

                2. Define the related `handle_event/3` callbacks to show/hide the dialog

                Here's our dialog in action along with the parent LiveView's code:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.StateManagement.Example01.Example id="example_01"/>
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveView</span></div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">show_dialog</span>, :boolean, default: <span style="color: rgb(86, 156, 214);">false</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Dialog</span> <span style="color: rgb(156, 220, 254);">title</span>=<span style="color: rgb(206, 145, 120);">"Alert"</span> <span style="color: rgb(156, 220, 254);">show</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@show_dialog</span> <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">hideEvent</span>=<span style="color: rgb(206, 145, 120);">"hide_dialog"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        The <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span>Dialog<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span> is a stateless component. All event handlers</div><div>        had to be defined in the parent <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span>LiveView<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span>.</div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Dialog</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(156, 220, 254);">click</span>=<span style="color: rgb(206, 145, 120);">"show_dialog"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Click to open<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"show_dialog"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, <span style="color: rgb(220, 220, 170);">assign</span>(socket, show_dialog: <span style="color: rgb(86, 156, 214);">true</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"hide_dialog"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, <span style="color: rgb(220, 220, 170);">assign</span>(socket, show_dialog: <span style="color: rgb(86, 156, 214);">false</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Notice that even the `"hide_dialog"` event which is dispatched by the dialog's
                internal "Ok" button had to be defined in the live view.

                One problem that might arise with this approach is that, as the parent live view
                gets larger holding more children with more complex states and events, a lot of
                code needs to be written in the live view to manage the state of each individual
                component.

                ## Handling state with `LiveComponent`

                In the last section, we saw that having lots of event handlers in a single LiveView might
                not be desired. One way to tackle this problem is by using a **stateful** LiveComponent
                instead. The great thing about live components is that they can handle their own state,
                consequently, we can move all component's related event handlers to the component itself.

                That sounds really great but it raises a question. If the parent doesn't own the dialog's
                state anymore, how can the dialog be opened by the parent?

                ### Introducing `send_update/2`

                The LiveView documentation states that _"send_update/2 is useful for updating a component
                that entirely manages its own state, as well as messaging between components."_

                That's exactly what we need! We can use `send_update/2` to tell the dialog to update
                itself, setting the `:show` assign to `true`:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"show_dialog"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>    send_update(<span style="color: rgb(156, 220, 254);">Dialog</span>, id: <span style="color: rgb(206, 145, 120);">"dialog"</span>, show: <span style="color: rgb(86, 156, 214);">true</span>)</div><div>    {:noreply, socket}</div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(106, 153, 85);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Although calling `send_update/2` from the parent view is a valid solution,
                from the design perspective, explicitly setting `:show` might not be ideal.
                Remember that the fact we need to change the `:show` assign in order to
                show/hide the dialog is an implementation detail. Leaking internal details
                of the state is problematic. Any change in the shape of the state might break
                our code in many different places. Maybe for a simple case like our show/hide
                that wouldn't be a big issue, but for more complex actions that update multiple
                assigns, maintaining those actions in sync may become a nightmare. The solution,
                however, is quite simple, we can define a public function `show/1` in the `Dialog`
                module to encapsulate the changes in the state.

                Here's the updated version of our `Dialog` component:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Dialog</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">title</span>, :string, required: <span style="color: rgb(86, 156, 214);">true</span></div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">show</span>, :boolean, default: <span style="color: rgb(86, 156, 214);">false</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(206, 145, 120);">"modal"</span>, "is-active": <span style="color: rgb(156, 220, 254);">@show</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-background"</span><span style="color: rgb(128, 128, 128);">&gt;&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">header</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-head"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">p</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-title"</span><span style="color: rgb(128, 128, 128);">&gt;</span><span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@title</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">p</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">header</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">section</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-body"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">section</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">footer</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"modal-card-foot"</span> <span style="color: rgb(156, 220, 254);">style</span>=<span style="color: rgb(206, 145, 120);">"justify-content: flex-end"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(156, 220, 254);">click</span>=<span style="color: rgb(206, 145, 120);">"hide"</span> <span style="color: rgb(156, 220, 254);">kind</span>=<span style="color: rgb(206, 145, 120);">"is-info"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Ok<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">footer</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(106, 153, 85);"># Public API</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">show</span>(dialog_id) <span style="color: rgb(197, 134, 192);">do</span></div><div>      send_update(<span style="color: rgb(86, 156, 214);">__MODULE__</span>, id: dialog_id, show: <span style="color: rgb(86, 156, 214);">true</span>)</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(106, 153, 85);"># Event handlers</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"show"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, assign(socket, show: <span style="color: rgb(86, 156, 214);">true</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"hide"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, assign(socket, show: <span style="color: rgb(86, 156, 214);">false</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                As you can see, the dialog's state is now opaque to the parent live view and
                any change to the internal state should only be performed through the component's
                public API.

                Let's take a look at our new dialog in action along with the parent's live view code:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.StateManagement.Example02.Example id="example_02"/>
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveView</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Dialog</span> <span style="color: rgb(156, 220, 254);">title</span>=<span style="color: rgb(206, 145, 120);">"Alert"</span> <span style="color: rgb(156, 220, 254);">id</span>=<span style="color: rgb(206, 145, 120);">"dialog"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        The <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span>Dialog<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span> is now a stateful component. All event handlers</div><div>        were defined in the component itself. <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span>Cool!<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">b</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Dialog</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Button</span> <span style="color: rgb(156, 220, 254);">click</span>=<span style="color: rgb(206, 145, 120);">"show_dialog"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Click to open the new dialog<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"show_dialog"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(156, 220, 254);">Dialog</span>.show(<span style="color: rgb(206, 145, 120);">"dialog"</span>)</div><div>      {:noreply, socket}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/slots">
                ← Slots
              </LiveRedirect>
              <LiveRedirect to="/contexts">
                Contexts →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
