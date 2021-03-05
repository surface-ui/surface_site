defmodule SurfaceSiteWeb.Properties do
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
                  <li class="is-active"><Link to="#" label="Properties" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Properties

                You can pass information from a parent component down to a child using **properties**.

                In order to declare a property, you must use the `prop` macro:

                > _**prop** name, type, options_

                Where:

                  * `name` - is the name of the property.
                  * `type` - an atom defining the type of the property. See all available types in section **"Property types"**.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the property as required. Default is `false`.
                  * `default` - defines a default value for an optional property.
                  * `values` - the list of possible values for the property.
                  * `accumulate` - instructs Surface to group all different values provided
                    for that property into a single list. Default is `false`, i.e. only the
                    last value is passed.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Properties.Example01.Example />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(106, 153, 85);"># Defining the component</span></div><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Hello</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "Someone to say hello to"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">name</span>, :string, required: <span style="color: rgb(86, 156, 214);">true</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      Hello, <span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@name</span> <span style="color: rgb(86, 156, 214);">}}</span>!</div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div>  <span style="color: rgb(106, 153, 85);"># Using the component</span></div><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Hello</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"John Doe"</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Property types

                When declaring a **property**, you can define the type of the assign using one of the
                following types:

                `:any`, `:css_class`, `:list`, `:event`,
                `:boolean`, `:string`, `:date`, `:datetime`, `:number`, `:integer`, `:decimal`, `:map`,
                `:fun`, `:atom`, `:module`, `:changeset`, `:form` and `:keyword`.

                > **Note**: Currently, some of the types above work just as annotations and don't have
                any practical use aside from documentation. If the type you need is not in that list,
                you can safely use `:any` instead. However, some other types like `:css_class`, `:list`
                and `:event` are handled differently, i.e. there are extra rules and behaviours applied
                to them.

                ## CSS class property

                In order to avoid working with string concatenation, which is annoying and error-prone,
                Surface allows passing keyword lists directly to the `class` property and improves
                developer experience by automatically handling conditional classes.
                Let's see how it works.

                Imagine you want to create a button component that sets CSS classes based on the following
                rules:

                  * `button` - always set
                  * `is-info` - always set
                  * `is-loading` - set if `@loading` is truthy
                  * `is-rounded` - set if `@rounded` is truthy

                We can define our component like this:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 15px; line-height: 23px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">MyButton</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(79, 193, 255);">Surface</span>.<span style="color: rgb(79, 193, 255);">Component</span></div><br><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">loading</span>, :boolean</div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">rounded</span>, :boolean</div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(206, 145, 120);">"button"</span>, <span style="color: rgb(206, 145, 120);">"is-info"</span>, "is-loading": <span style="color: rgb(156, 220, 254);">@loading</span>, "is-rounded": <span style="color: rgb(156, 220, 254);">@rounded</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Let's try it out.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Properties.Example02.Example id="example_02" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                  <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">MyButton</span> <span style="color: rgb(156, 220, 254);">loading</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@loading</span> <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">rounded</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@rounded</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    Change my style!</div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">MyButton</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                > **Note:** For regular HTML tags like `<button>`, the `class` attribute will be handled automatically
                as expected. For custom components, you need to instruct Surface to do so by setting the type of the
                property as `:css_class`.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/components_basics">
                ← Components Basics
              </LiveRedirect>
              <LiveRedirect to="/data">
                Data →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
