defmodule SurfaceSiteWeb.ScopedCSS do
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
                  <li class="is-active"><a href="#">Scoped CSS</a></li>
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
                  * Auto generate Taiwind variants based on `prop`/`data` using the `css_variant` option.
                  * Zero-configuration in `app.css` or any other file when adding new Surface components, including
                    those from dependencies. The compiler will automatically collect and process all Surface component-related
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

                ## Scopes by module

                By default, styles defined in a colocated `.css` file are scoped by module, which means any function
                components defined in the same module will belong to the same scope. If you need a function component
                to define its own scope, use `<style>` in that component instead.

                ## How does it work?

                Scoped CSS is achieved by instructing the Surface compiler to inject a `s-*` attribute to elements
                affected by the CSS declarations. The selectors are also translated so they can only apply to the
                related elements.

                In the last example, the translated CSS code would look something, like:

                ```css
                .tag[s-9651d1c] {
                  @apply px-3 py-1 mr-2 rounded-full font-semibold text-sm text-gray-700 bg-gray-200;
                }
                ```

                And the generated HTML code, something like:

                ```surface
                <div>
                  <span s-9651d1c class="tag">...</span>
                  <span s-9651d1c class="tag">...</span>
                  <span s-9651d1c class="tag">...</span>
                </div>
                ```

                ## Deep selectors

                By default, the scoped CSS declarations only apply to the elements defined in the same module.
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

                ## Generating CSS variants (Tailwind only)

                CSS variants provide a declarative way to conditionally apply certain CSS classes according
                to their values. You can instruct the Surface compiler to automatically generate tailwind variants
                based on defined assigns. In order to define CSS variants for your templates, you can use the `css_variant`
                option, which is available for both, `prop` and `data`.

                > **Note**: If you have initialized your project using `mix surface.init`, you should have CSS variants already enabled.
                > If that's not the case, you can anable it by following the instructions in [Surface compiler's options](https://hexdocs.pm/surface/Mix.Tasks.Compile.Surface.html#module-options).

                ### Example

                ```elixir
                 prop loading, :boolean, css_variant: true
                 prop size, :string, values: ["small", "large"], css_variant: true
                ```

                By declaring `css_variant`, a set of default variants will be automatically available in your templates
                and can be used directly in any `class` attribute. By default, all variants' names will
                start with the `@` prefix.

                ### Example

                ```surface
                <button class="@loading:opacity-75 @size-small:text-sm @size-large:text-lg">
                  Submit
                </button>
                ```

                ## CSS variants naming convention

                Depending on the type defined for your prop/data, as well as the options passed, a different set of
                variants may be generated for each possible value.

                Here's the default naming convention for each type:

                ### Boolean

                * The `assign-name` itself, if `true`.
                * `not-[assign-name]`, if `false`.

                Example:

                ```surface
                <div class="@loading:opacity-75 @not-loading:opacity-100">
                  ...
                </div>
                ```

                ### Enumerables (`:list`, `:map` and `:mapset`)

                * `has-[assign-name]` - if the enumerable has items.
                * `no-[assign-name]` - if the enumerable is empty or `nil`.

                ```surface
                <div class="@has-items:text-blue-500 @no-items:text-red-500">
                  ...
                </div>

                ```

                ### Strings, atoms and integers defining `values` or `values!`

                * `[assign-name]-[value]` for each `value` in `values`.

                Example:

                ```surface
                <div class="@size-small:text-sm @size-medium:text-base @size-large:text-lg">
                  ...
                </div>
                ```

                ### All other types

                * The `assign-name` itself, if the value is not `nil`.
                * `not-[assign-name]`, if the value is `nil`.

                ## Customizing CSS variants

                If you need to perform further customization, like changing the generated variants' names or prefix, please see the
                [Customizing variants' names](https://hexdocs.pm/surface/Mix.Tasks.Compile.Surface.html#module-customizing-variants-names)
                section in the docs.

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
              <.link navigate="/js_interop">
                ← JS Interoperability
              </.link>
              <.link navigate="/layouts_and_dead_views">
                Layouts &amp; dead views →
              </.link>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
