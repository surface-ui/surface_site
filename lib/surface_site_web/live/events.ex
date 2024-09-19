defmodule SurfaceSiteWeb.Events do
  use Surface.LiveView

  alias Surface.Components.Markdown
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
                  <li><.link navigate="/">Home</.link></li>
                  <li><.link navigate="/documentation">Documentation</.link></li>
                  <li class="is-active"><a href="#">Events</a></li>
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

                ## Handling events in Surface

                Instead of treating templates as plain text, Surface parses the code identifying
                its structure (the hierarchy of components) and uses that information to
                restore the initially desired behaviour of handling events in LiveView. Bear in mind
                that in order to keep the behaviour consistent and predictable across multiple components,
                you should:

                  * always use the `:on-[event]` directive in HTML tags.
                  * always declare event properties in components using the type `:event`

                > **Note**: You can still use Phoenix's built-in `phx-[event]` directly in HTML tags if you want,
                however, if you need to pass that event as a property before, you should declare that property as
                `:string` instead of `:event`.

                ## Using the `:on-[event]` directive

                The `:on-[event]` directive can configure a server event binding by automatically generating the `phx-[event]`
                and `phx-target` attributes in the HTML tag, defining the component itself as the default handler (target).
                This is the preferred way to use `phx` events in **Surface** as it can properly handle properties of type `:event`.

                Available directives are: `:on-click`, `:on-capture-click`, `:on-blur`, `:on-focus`,
                `:on-change`, `:on-submit`, `:on-keydown`, `:on-keyup`, `:on-window-focus`, `:on-window-blur`,
                `:on-window-keydown` and `:on-window-keyup`.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.SurfaceCounter.Counter id="surface_counter" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Events.SurfaceCounter}
                    show_line_numbers
                    line_range={2..-3//-1}
                  />
                </footer>
              </div>

              <#Markdown>
                As you can see, we didn't have to define `phx-target` for any of the buttons. Sweet!

                > **IMPORTANT**: Pay attention that `:on-[event]` directives can only be used in HTML tags, **not components**.
                The reason is because, unlike a tag, a component may render more than one DOM element so
                it's up to the component's author to define the component's public API, including its exposed events,
                and properly forward those events to the related HTML elements they belong.

                The complete list of available events, as well as other types of bindings, can be found in the
                [Bindings](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-bindings)
                section of the docs for Phoenix LiveView.

                ## Passing events through `:event` properties

                Another great thing about Surface's approach is that it makes passing events as properties
                also more intuitive. Using phoenix templates, unless you always pass both, the event and the target,
                you cannot be sure where the event will be handled. You need to know upfront if there's a `phx-target`
                defined for that DOM element inside that component. Using Surface, the event is **always** passed
                along with the related target, assuming, by default, that the target is the caller component/view.

                In the above examples the events have been handled by the component itself.
                Sometimes the parent component needs to handle the event.
                For that kind of use case, you must declare the event in the child component by using the `prop`
                macro defining the type as `:event` and pass its value to the underlying HTML tag using the `:on-[event]` directive.
              </#Markdown>

              See the properties <.link navigate="/properties#event-property">Event</.link> section for more details about event properties.

              <#Markdown>
                ### Stateless component

                The simplest case you need to pass an event is when you create a stateless component that includes an element
                that defines a server binding (event). Since the component is stateless, it cannot handle the event by itself
                so it needs to receive the event handler as a property.

                For example, imagine a `Button` stateless component that triggers an event when the user clicks on it.
                In the following example, we create that stateless component.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Events.LiveButton}
                line_range={2..18}
                show_line_numbers
                selected_lines="5, 12"
              />

              <#Markdown>
              We declared a required `click` event property that we use on the `<button>` tag with the `:on-click` directive.

              Now let's see how to define and pass events to that stateless component.
              We will use the `Button` component twice, each with a different handling function that has been defined in a parent live component.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.LiveButton.Example id="surface_counter_2" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Events.LiveButton}
                    line_range={20..42}
                    show_line_numbers
                  />
                </footer>
              </div>

              <#Markdown>
                Remember that stateless components cannot handle events and do not have state.
                Events can only be handled in a `LiveView` or `LiveComponent` so we will store the state in that kind of component.

                ### Stateful component

                In some cases, you may want to have a default behaviour that is handled by the component itself and let the developer override the default implementation with a custom one. To implement a default behaviour, the component must implement an `handle_event/3` function, and so it must to be stateful.

                One example is a generic stateful `Dialog` component.
                By default, if the user clicks "Close", the dialog is hidden. However, if you're using the dialog to show a form
                where the user must fill in lots of information, you may want to ask for confirmation before closing it.
                Something like: _"Are you sure you want to close this form? All information provided will be lost."_.

                To implement such feature, you need to provide a default local implementation that closes the dialog,
                along with a way to override this implementation if the parent component passes its own custom logic.
                In our case, we want to ask for confirmation before closing it.

                First let's take a look at our generic `<Dialog>` component and its events.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Events.DialogExample}
                line_range={2..52}
                show_line_numbers
                selected_lines="9-10, 48-50"
              />

              <#Markdown>
                The component implements a default `handle_event` that handles the `close` event and provides two public
                functions that can be used by other components to open and close the modal.

                > **Note:** We're using `send_update/2` to set the value of the `:show` data assign. We'll get into
                > more details about `send_update/2` in the [State management](/state_management) page.

                Also notice that the stateful `Dialog` component reuses the stateless `Button` component
                defined at the beginning of this section and the events defined are passed along to these
                buttons components.

                Now, we can use the dialog component with his default behaviour.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithDefaultBehaviour id="event_default_dialog_example" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Events.DialogExample.ExampleWithDefaultBehaviour}
                    line_range={54..82}
                  />
                </footer>
              </div>

              <#Markdown>
                If you want to change the default behaviour of closing the dialog automatically, all you have to do is
                pass that custom event using the `close` prop. Remember, we want to ask for confirmation to close the modal.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Events.DialogExample.ExampleWithOverwrittenBehaviour id="event_overwritten_dialog_example" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Events.DialogExample.ExampleWithOverwrittenBehaviour}
                    line_range={84..-3//-1}
                  />
                </footer>
              </div>

              <#Markdown>
                ## Choosing another target

                As explained, by default, Surface **always** passes the event name along with the default target
                (the caller component/view). This should cover most of the cases you have to face when working with events.

                In case you still need the event to be handled by any other component/view, you can explicitly pass the target
                using the `target` option.

                ### Examples

                Using `:on-click` in HTML tags:

                ```surface
                <button :on-click={"click", target: "#target_id"}>
                  OK
                </button>
                ```

                Passing a prop of type `:event` to a component:

                ```surface
                <Button click={"click", target: "#target_id"}>
                  OK
                </Button>
                ```

                If you want the target to be the parent LiveView, you can set the target option as `:live_view`.

                ```surface
                <button :on-click={"click", target: :live_view}>
                  OK
                </button>
                ```
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <.link navigate="/data">
                ← Data
              </.link>
              <.link navigate="/slots">
                Slots →
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
