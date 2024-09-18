defmodule SurfaceSiteWeb.StateManagement do
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
                the `assigns`, the `assigns` will be passed to the `render/1` function and that's it. You cannot
                define events that can change any of the assigned values. If you want to do that, you'll have to
                change the values passed as properties in the parent component, forcing the `render/1` function
                to be called again with the updated values.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.StateManagement.Example01.Button}
                line_range={2..17}
              />

              <#Markdown>
                ## Handling state with `LiveView`

                Consider the following Dialog component:
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.StateManagement.Example01.Dialog}
                line_range={19..46}
              />

              <#Markdown>
                The `Dialog` above is a stateless component, i.e. it doesn't own its state and all
                state handling must be done in the parent `LiveView` by:

                1. Defining a new `data` assign called `:show_dialog` to hold the state

                2. Define the related `handle_event/3` callbacks to show/hide the dialog

                Here's our dialog in action along with the parent LiveView's code:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.StateManagement.Example01.Example id="example_01" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.StateManagement.Example01.Example}
                    line_range={48..-3//-1}
                  />
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

                ## Introducing `send_update/2`

                The LiveView documentation states that _"send_update/2 is useful for updating a component
                that entirely manages its own state, as well as messaging between components."_

                That's exactly what we need! We can use `send_update/2` to tell the dialog to update
                itself, setting the `:show` assign to `true`:

                ```elixir
                def handle_event("show_dialog", _, socket) do
                  send_update(Dialog, id: "dialog", show: true)
                  {:noreply, socket}
                end
                ```

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

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.StateManagement.Example02.Dialog}
                line_range={19..62}
              />

              <#Markdown>
                As you can see, the dialog's state is now opaque to the parent live view and
                any change to the internal state should only be performed through the component's
                public API.

                Let's take a look at our new dialog in action along with the parent's live view code:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.StateManagement.Example02.Example id="example_02" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.StateManagement.Example02.Example}
                    line_range={64..-3//-1}
                  />
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
