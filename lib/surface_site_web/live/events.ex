defmodule SurfaceSiteWeb.Events do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar
  alias SurfaceSiteWeb.Components.Code

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
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.PhoenixCounter }}
                    line_range={{ 2..35 }}
                  />
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
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.SurfaceCounter }}
                    show_line_numbers
                    line_range={{ 2..23 }}
                    selected_lines="13-15"
                  />
                </footer>
              </div>

              <#Markdown>
                As you can see, we didn't have to define `phx-target` for any of the buttons. Sweet!

                > **Note**: The complete list of available events, as well as other types of bindings, can be found at
                section [Bindings](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-bindings)
                in the Phoenix LiveView's docs.

                ## Pass event through an `event` property

                Another great thing about Surface's approach is that it makes passing events as properties
                also more intuitive. Using phoenix templates, unless you always pass both, the event and the target,
                you cannot be sure where the event will be handled. You need to know upfront if there's a `phx-target`
                defined for that DOM element inside that component. Using Surface, the event is **always** passed
                along with the related target, assuming, by default, that the target is the caller component/view.

                In the above examples the events have been handled by the component itself.
                Sometime the component does not know how to handle an event and you would like to handle this event in the parent component.
                For that kind of use case, you must declare the event in the child component by using the `prop` macro defining the type as `:event`,
                and pass the value of that prop to the `:on-[event]` directive.
              </#Markdown>

                See the properties <LiveRedirect label="Event" to="/properties#event-property" /> section for more details about event properties.

              <#Markdown>
                ### Stateless component

                The simplest case you need to pass an event is when you create a stateless component that includes an element
                that defines a server binding (event). Since the component is stateless, it cannot handle the event by itself
                so it needs to receive the event handler as a property.

                For example, imagine a `Button` stateless component that raises an event when the user clicks on it.
                In the following example, we create that stateless component.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.LiveButton }}
                    line_range={{ 2..18 }}
                    show_line_numbers
                    selected_lines="5, 12"
                  />
                </footer>
              </div>

              <#Markdown>
              We declared a required `click` event property that we use on the `<button>` tag with the `:on-click` directive.

              Now let's see how to define and pass events to that stateless component.
              We will use twice the `Button` component with two different handling functions that have been defined in a parent live component.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.LiveButton.Example
                    id="surface_counter_2"
                  />
                </div>
                <footer class="card-footer">
                <#Code
                  language="elixir"
                  module={{ SurfaceSiteWeb.Events.LiveButton }}
                  line_range={{ 20..42 }}
                  show_line_numbers
                  selected_lines="10-11, 16-18, 20-22"
                />
                </footer>
              </div>

              <#Markdown>
                Remember that stateless components cannot handle events and do not have state.
                Events can only be handled in a `LiveView` or `LiveComponent` so we will store the state in that kind of component.
              </#Markdown>

              <#Markdown>
                ### Stateful component
                In some case, you want to have a default behaviour that is handled by the component itself and you want to let the developer overrides the default implementation with a custom one. To implement a default behaviour, the component must implement an `handle_event/3` function, and so it requires to be stateful.

                One example is a generic stateful `Dialog` component with a close button.
                By default, if the user clicks the close button, that will close the modal. However, if you're using the dialog to show a form
                that the user must fill in lots of information, you might want to confirm if the user really wants to close it and ask for confirmation.
                Something like: _"Are you sure you want to close this form? All information provided will be lost."_.

                To impement this feature, you need a default local implementation that closes the dialog
                but this implementation can be overridden by the parent component by passing a custom implementation
                that, in our case, asks for confirmation before closing it.

                First let's take a look at the `<Dialog>` component and its events.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.DialogExample }}
                    line_range={{ 2..48 }}
                    show_line_numbers
                    selected_lines="8, 44-46"
                  />
                </footer>
              </div>

              <#Markdown>
                The component implement a default `handle_event` that handles  the `close` event, and two public API functions,
                that can be used by other components to show or close the modal.

                Note that the `Modal` stateful component reuses the `Button` stateless component
                defined at the beginning of this section, and the events are passed along to these buttons components.

                Now take a look at how we can use the dialog component with his default behaviour.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithDefaultBehaviour id="event_default_dialog_example" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.DialogExample }}
                    line_range={{ 95..116 }}
                  />
                </footer>
              </div>

              <#Markdown>
                Now if you want to change the default behaviour of closing the dialog automatically, all you have to do is pass that custom event using the `close` prop.
                Remember, we want to ask for confirmation to close the modal.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithOverwrittenBehaviour id="event_overwritten_dialog_example" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.Events.DialogExample }}
                    line_range={{ 50..93 }}
                  />
                </footer>
              </div>

              <#Markdown>

                ## Handle event somewhere else

                Using Surface, the event is **always** passed along with the related target, assuming,
                by default, that the target is the caller component/view. This should cover most of the
                cases you have to face when working with events. In the rare cases when you need to handle the
                event somewhere else, you can explicitly pass the target, e.g., `click={{ "click", target: "#target_id" }}`.
                If you want the target to be the parent LiveView, you can set the target option as `:live_view`.

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
