defmodule SurfaceSiteWeb.Data do
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
                  <li class="is-active"><Link to="#" label="Data" /></li>
                </ul>
              </nav>

              <#Markdown>
                # Data

                Stateful components like `Surface.LiveView` and `Surface.LiveComponent` hold
                their state in the socket's `assigns`. In **Surface**, those assigns are called
                **data assigns**.

                In order to declare a data assign, you must use the `data` macro:

                > _**data** name, type, options_

                Where:

                  * `name` - is the name of the assign.
                  * `type` - an atom defining the type of the assign. See all available types in
                    section ["Components Basics > Types available"](/components_basics#types-available).
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `default` - defines a default value for the assign.
                  * `values` - the list or range of values suggested for the assign.
                  * `values!` - the list or range of all possible values for the assign. Unlike `values`, this
                    option enforces validation of the default value against the given list.
                  * `from_context` - sets the value to the one stored in the context under the given key.

                In the following example, we create a simple `Counter` component that has its state
                defined by a single assign named `count`. You can use the `-` and `+` buttons to
                decrement/increment the counter's value.
                > **Note**: The `data` macro is available in both stateful and stateless components.
                It allows you to define intermediary assigns in the `update` function of the component
                that computes values based on one or several properties.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Data.Example01.Counter id="example01" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Data.Example01.Counter}
                    line_range={2..-3}
                    show_line_numbers
                    selected_lines="4"
                  />
                </footer>
              </div>

              <#Markdown>
                > **Note**: Since we defined a default value for `count`, we don't need to
                implement the `mount/1` callback to initialize it. All `data` assigns with
                default values will be automatically initialized by **Surface**.
                That means if you need some `data` to be initialized, you need to add a default value, even if it's `nil`.
                If you do not add a default value, the `data` is not initialized.
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
