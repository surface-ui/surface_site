defmodule SurfaceSiteWeb.ScopedCSS do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
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
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li><LiveRedirect label="Documentation" to="/documentation" /></li>
                  <li class="is-active"><Link to="#" label="Scoped CSS" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Scoped CSS styles

                When defining a component or LiveView, you can declare its CSS styles directly in the template
                using `<style>` or in a colocated `.css` file. The Surface compiler will treat those styles as scoped
                styles so any CSS declaration will apply only to the related component.

                Some of the benefits are:

                  * Better code organization as each component style can be defined alongside its component
                  * Avoid conflicts between components rules as each declaration is scoped per component
                  * Prevent CSS rules from the parent components from leaking into child elements or other
                    components.
                  * Support injecting elixir expressions into the CSS declarations using `s-bind()`, allowing users to apply
                    dynamic values to CSS properties based on the components' assigns. One great thing about this approach
                    is that it keeps the CSS syntax valid so it doesn't affect tools that depend on valid CSS syntax
                    like editor highlighters, linters, etc.
                  * Zero-configuration in `app.css` or any other file when importing new components, including
                    components from dependencies. The compiler will automatically collect and process all component-related
                    styles seamlessly.

                ## Usage with colocated `.css` file

                Create a colocated `.css` file with the same base name of the component. Like:

                ```
                my_app_web/components
                ├── ...
                ├── card.ex
                ├── card.css
                ```

                All CSS rules defined in that file will be scoped by the related component.

                ## Usage with `<style>`

                Place your CSS rules inside a `<style>` tag as the first node of your template.

                ### Example

                ```elixir
                def render(assigns) do
                  ~F"\""
                  <style>
                    .tag {
                      @apply bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2;
                    }
                  </style>

                  <div>
                    <span class="tag">#surface</span>
                    <span class="tag">#phoenix</span>
                    <span class="tag">#tailwindcss</span>
                  </div>
                  "\""
                end
                ```

                As with colocated files, all CSS rules defined inside `<style>` will be scoped and applies only to the
                local HTML elements.

                ## How does it work?

                Scoped CSS is achieved by instructing the compiler to inject a `data-s-*` attribute to elements
                affected by the CSS declarations. The selectors are also translated so they can only apply to the
                related elements.

                In the last example, the translated CSS code would look something, like:

                ```css
                .tag[data-s-9651d1c] {
                  @apply px-3 py-1 mr-2 rounded-full font-semibold text-sm text-gray-700 bg-gray-200;
                }
                ```

                And the generated HTML code, something like:

                ```surface
                <div>
                  <span data-s-9651d1c class="tag">...</span>
                  <span data-s-9651d1c class="tag">...</span>
                  <span data-s-9651d1c class="tag">...</span>
                </div>
                ```

                ## Deep selectors

                By default, the scoped CSS declarations only apply to the elements defined by the component itself.
                However, sometimes it might be useful to bypass that rule. For instance, when you're creating a
                parent component that will be responsible for the layout of its children.

                For those cases, you should use the `:deep()` pseudo-class:

                ```css
                .parent :deep(.child) {
                  ...
                }
                ```

                ## Global selectors

                In order to apply styles to child components based on global classes, you need
                to use the `:global()` pseudo-class so instruct the compiler to not add scope
                information to the related elements.

                Common cases are theme-related and global status classes, e.g. `.dark`,
                `.phx-connected` and `.phx-loading`.

                ```css
                :global(.dark) .link {
                  ...
                }
                ```

                ## Dynamic property values

                You can inject elixir expressions into CSS property values using `s-bind()`

                ### Example

                ```css
                .btn {
                  background-color: s-bind('@color');
                }
                ```

                Where `@color` is a component assign but could be any valid elixir expression that will be evaluated at runtime.

                ## Limitations

                The CSS world is extremely large and there are many different valid solutions to solve
                the same problem. None of them are silver bullets. It's always about trade-offs. Most of
                the solutions out there implementing scoped CSS require extra tooling. Which is fine,
                especially if that tooling is already in your stack.

                For Surface, we wanted to bring a solution that would cover the most common cases and depended
                only on its built-in compiler. Our current solution was inspired by
                [Vue's SFC CSS Features](https://vuejs.org/api/sfc-css-features.html).
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/js_interop">
                ← JS Interoperability
              </LiveRedirect>
              <LiveRedirect to="/layouts_and_dead_views">
                Layouts &amp; dead views →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
