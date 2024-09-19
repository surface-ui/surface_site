defmodule SurfaceSiteWeb.Contexts do
  use Surface.LiveView

  alias Surface.Components.Markdown
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar

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
                  <li class="is-active"><a href="#">Contexts</a></li>
                </ul>
              </nav>
              <#Markdown>
                # Contexts

                Depending on the requirements of your project, as the tree of components start to grow deeper,
                you may face situations where some piece of information must be available in many different
                components down the tree. For instance, the user's id or the timezone. The classical solution
                is to pass that information as properties until it reaches its destiny.
                For small projects where you don't have too many child components in that situation, that's not only
                fine, but usually preferred. However, for larger project with many levels of components, this
                potentially becomes hard to maintain as every single parent component must define the very same
                property, forcing the user to explixitly pass that unipresent piece of information all over the system.
                A problem known as **"Property drilling"**.

                In order to overcome such problem, Surface provides a Context API, which allow users to store
                values in a shared data structure on a higher level in the tree and then access those values
                anywhere in the lower levels.

                > **Warning**: Currently, context values do not propagate to [function components](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html)
                unless you implement it as a [module component](https://hexdocs.pm/surface/Surface.Component.html).

                The easiest way to use contexts is to store values using `Context.put/3` and retrieving them
                with the `from_context` option.

                # Example

                Storing the value in a parent Liveview:

                ```elixir
                def mount(_params, _session, socket) do
                  socket = Context.put(socket, timezone: "UTC")
                  {:ok, socket}
                end
                ```

                Retrieving the value from the context in any component down the tree:

                ```elixir
                data timezone, :string, from_context: :timezone

                def render(assigns) do
                  ~F"\""
                  <h1>Timezone: {@timezone}<h1>
                  "\""
                end
                ```

                > **Note**: Although storing values in contexts might be an interesting way to
                avoid property drilling, you must use them carefully. Overusing them will make
                your code less efficient and less explicit, which may lead to components that are harder to reason
                about. We recommend using context only for more global information like user-related
                info that is not frequently updated.

                ## Namespacing context values

                One important thing to keep in mind it that storing values from different components
                might lead to naming conflicts. To avoid that, Surface allows you to "namespace" the
                values stored using an extra scope key.

                The key is just an `atom` and can usually be the component's module. For instance:

                Instead of:

                ```elixir
                socket = Context.put(socket, form: form)
                ```

                you can use:

                ```elixir
                socket = Context.put(socket, __MODULE__, form: form)
                ```

                That would create a composite key containing both atoms, i.e. `{Form, :form}` for that value.

                Now, whenever you need to retrieve the value, you must pass the scope too:

                ```elixir
                form = Context.get(socket_or_assigns, Form, :form)
                ```

                ```surface
                data form, :form, from_context: {Form, :form}
                ```

                > **Note:** If you want to distribute a library that stores values into the context,
                it's highly recommended that you **always** scope those values as demonstrated. This way
                you make sure it can play nicely with other libraries that also use contexts.

                ## Scope-aware context

                > **Soft deprecation alert:** Scope-aware context will be deprecaded in the near future and fully removed
                > in `v0.13`. The reason is the lack of built-in support for that feature in Liveview itself, which
                > leads to inefficient diff-tracking when using it. Global context related functions like `Context.put`
                > and `Context.get`, as well as the `:from_context` option, will be kept as their use don't affect diff-tracking negatively.

                Sometimes you need to initialize values that should be propagated only inside the component's
                scope via its slots. For instance, when working with forms in Phoenix, you usually need to
                define a form variable that has to be passed to input elements along with each field name.

                Using Surface contexts, you can improve the developer experience by not forcing one to
                pass the **form** and **field** values multiple times. Instead, you can store those
                values in the **context** and retrieve them in the child components when needed.

                You can use `<#slot context_put={}/>` to propagate context values directly to a slot or
                `<Context put={}>...</Context>` when you need to propagate them to all slots and children
                inside a block. Using `<Context put={}>` is less efficient diff-tracking-wise so it should
                be used only when `<#slot context_put={}/>` is not an option.

                All Surface built-in form/input components provided implement this approach so you can use
                them as:

                ```surface
                <Form for={%{}} as={:user} change="change">
                  <Field name="name">
                    <Label/>
                    <TextInput/>
                    <ErrorTag/>
                  </Field>
                  <Field name="email">
                    <Label>E-mail</Label>
                    <TextInput/>
                    <ErrorTag/>
                  </Field>
                </Form>
                ```

                > **Note**: Using scope-aware context is more expensive than using regular context via `Context.put/3`.
                The reason is that the former relies on variables to be passed down to the slots and should only be
                used when you already need to use variables, like in the example above that, behind the scenes, use
                the form instance created by the underlying LV's `<.form>` component.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <.link navigate="/state_management">
                ← State Management
              </.link>
              <.link navigate="/testing">
                Testing →
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
