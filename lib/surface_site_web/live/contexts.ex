defmodule SurfaceSiteWeb.Contexts do
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
                  <li class="is-active"><Link to="#" label="Contexts" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Contexts

                Sometimes you need to initialize some kind of context before using a component. For instance,
                when working with forms in Phoenix templates, you usually need to define a form variable that
                can be passed to form elements along with each field name. Here's an example:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Contexts.Example01.ExamplePhoenix id="example_01_phoenix" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(86, 156, 214);">&lt;%=</span> form = form_for <span style="color: rgb(156, 220, 254);">@changeset</span>, <span style="color: rgb(206, 145, 120);">"#"</span>, phx_change: :validate, autocomplete: <span style="color: rgb(206, 145, 120);">"off"</span> <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"field"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(86, 156, 214);">&lt;%=</span> label form, :name, class: <span style="color: rgb(206, 145, 120);">"label"</span> <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"control"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(86, 156, 214);">&lt;%=</span> text_input form, :name, class: input_class(form, :name) <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>        <span style="color: rgb(86, 156, 214);">&lt;%=</span> error_tag form, :name <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"field"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(86, 156, 214);">&lt;%=</span> label form, :email, class: <span style="color: rgb(206, 145, 120);">"label"</span> <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"control"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(86, 156, 214);">&lt;%=</span> text_input form, :email, class: input_class(form, :email), placeholder: <span style="color: rgb(206, 145, 120);">"Try me!"</span>  <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>        <span style="color: rgb(86, 156, 214);">&lt;%=</span> error_tag form, :email <span style="color: rgb(86, 156, 214);">%&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">form</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Using Surface contexts, you can improve the developer experience by not forcing one to
                pass the **form** and **field** values multiple times. Instead, you can store those
                values in the **context** and retrieve them in the child component when needed.

                > **Note**: Although storing values in contexts might be an interesting way to
                avoid **"Property drilling"**, you must use them carefully. Overusing them will make
                your code less explicit, which may lead to components that are harder to reason
                about.

                Here's the updated version of our form now using components and contexts:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Contexts.Example01.Example id="example_01" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Form</span> <span style="color: rgb(156, 220, 254);">for</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@changeset</span> <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">change</span>=<span style="color: rgb(206, 145, 120);">"validate"</span> <span style="color: rgb(156, 220, 254);">autocomplete</span>=<span style="color: rgb(206, 145, 120);">"off"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Field</span> <span style="color: rgb(156, 220, 254);">field</span>=<span style="color: rgb(206, 145, 120);">"name"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">TextInput</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Field</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Field</span> <span style="color: rgb(156, 220, 254);">field</span>=<span style="color: rgb(206, 145, 120);">"email"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">TextInput</span> <span style="color: rgb(156, 220, 254);">placeholder</span>=<span style="color: rgb(206, 145, 120);">"Try me!"</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Field</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Form</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ### Using `<Context>`

                You can `put` or `get` values to/from the context using the `Context` component.

                ### Putting values into the context

                Let's take a look at our `Form` component.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Form</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Component</span></div><br><div>    <span style="color: rgb(86, 156, 214);">import</span> <span style="color: rgb(79, 193, 255);">Phoenix</span>.<span style="color: rgb(79, 193, 255);">HTML</span>.<span style="color: rgb(79, 193, 255);">Form</span></div><div>    <span style="color: rgb(86, 156, 214);">alias</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Components</span>.<span style="color: rgb(79, 193, 255);">Raw</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">for</span>, :any, required: <span style="color: rgb(86, 156, 214);">true</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">change</span>, :event</div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">autocomplete</span>, :string, values: [<span style="color: rgb(206, 145, 120);">"on"</span>, <span style="color: rgb(206, 145, 120);">"off"</span>]</div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(86, 156, 214);">{{</span> form = form_for(<span style="color: rgb(156, 220, 254);">@for</span>, <span style="color: rgb(206, 145, 120);">"#"</span>,</div><div>         phx_change: assigns.change.name,</div><div>         autocomplete: assigns.autocomplete) <span style="color: rgb(86, 156, 214);">}}</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Context</span> <span style="color: rgb(156, 220, 254);">put</span>=<span style="color: rgb(86, 156, 214);">{{</span> form: form <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Context</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">#Raw</span><span style="color: rgb(128, 128, 128);">&gt;&lt;/</span><span style="color: rgb(86, 156, 214);">form</span><span style="color: rgb(128, 128, 128);">&gt;&lt;/</span><span style="color: rgb(78, 201, 176);">#Raw</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                The value of variable `form` will be stored in the context under the key `:form` and will be
                available to any child component inside `<Context>...</Context>`, including any instance present
                in the content assigned to the "default" slot.

                We can use the same concept in our `Field` component and add the field name to the context too:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Field</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Component</span></div><br><div>    <span style="color: rgb(86, 156, 214);">import</span> <span style="color: rgb(79, 193, 255);">Phoenix</span>.<span style="color: rgb(79, 193, 255);">HTML</span>.{<span style="color: rgb(79, 193, 255);">Form</span>, <span style="color: rgb(79, 193, 255);">Tag</span>}</div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The field name"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">name</span>, :string, required: <span style="color: rgb(86, 156, 214);">true</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"field"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Context</span> <span style="color: rgb(156, 220, 254);">get</span>=<span style="color: rgb(86, 156, 214);">{{</span> form: form <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(86, 156, 214);">{{</span> label form, <span style="color: rgb(156, 220, 254);">@name</span>, class: <span style="color: rgb(206, 145, 120);">"label"</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"control"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Context</span> <span style="color: rgb(156, 220, 254);">put</span>=<span style="color: rgb(86, 156, 214);">{{</span> field: <span style="color: rgb(79, 193, 255);">String</span>.to_atom(<span style="color: rgb(156, 220, 254);">@name</span>) <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>              <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Context</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(86, 156, 214);">{{</span> error_tag form, <span style="color: rgb(156, 220, 254);">@name</span> <span style="color: rgb(86, 156, 214);">}}</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Context</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">defp</span> <span style="color: rgb(220, 220, 170);">error_tag</span>(form, field) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(79, 193, 255);">Enum</span>.map(<span style="color: rgb(79, 193, 255);">Keyword</span>.get_values(form.errors, <span style="color: rgb(79, 193, 255);">String</span>.to_atom(field)), <span style="color: rgb(197, 134, 192);">fn</span> {error, <span style="color: rgb(106, 153, 85);">_</span>} -&gt;</div><div>        content_tag(:p, error, class: <span style="color: rgb(206, 145, 120);">"help is-danger"</span>)</div><div>      <span style="color: rgb(197, 134, 192);">end</span>)</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ### Retrieving values from the context

                Now that we have both values, `form` and `field` properly stored in the context,
                the `TextInput` component can access those values and use them as need:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">TextInput</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Component</span></div><br><div>    <span style="color: rgb(86, 156, 214);">import</span> <span style="color: rgb(79, 193, 255);">Phoenix</span>.<span style="color: rgb(79, 193, 255);">HTML</span>.<span style="color: rgb(79, 193, 255);">Form</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">placeholder</span>, :string</div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Context</span> <span style="color: rgb(156, 220, 254);">get</span>=<span style="color: rgb(86, 156, 214);">{{</span> form: form, field: field <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(86, 156, 214);">{{</span> text_input(form, field,</div><div>          class: css_class([<span style="color: rgb(206, 145, 120);">"input"</span>, isDanger: <span style="color: rgb(79, 193, 255);">Keyword</span>.has_key?(form.errors, field)]),</div><div>          placeholder: <span style="color: rgb(156, 220, 254);">@placeholder</span></div><div>        ) <span style="color: rgb(86, 156, 214);">}}</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Context</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Scoping context values

                One important thing to keep in mind it that storing values from different components
                might lead to naming conflicts. To avoid that, Surface allows you to "namespace" the
                values stored using an extra scope key.

                The key is just an `atom` and can usually be the component's module. For instance:

                Instead of:

                `<Context put={{ form: form }}>`

                you can use:

                `<Context put={{ __MODULE__, form: form }}>`

                That would create a composite key containing both atoms, i.e. `{Form, :form}` for that value.

                Now, whenever you need to retrieve the value, you must pass the scope too:

                `<Context get={{ Form, form: f }}>`

                > **Note:** If you want to distribute a library that store values into the context,
                it's highly recommended that you **always** scope those values as demonstrated. This way
                you make sure it can play nicely with other libraries that also use contexts.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/state_management">
                ← State Management
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
