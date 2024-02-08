defmodule SurfaceSiteWeb.Slots do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar
  alias SurfaceSiteWeb.Components.{Code, LiveExample}

  alias SurfaceSiteWeb.Slots.DeclaredSlotExample.Hero
  alias SurfaceSiteWeb.Slots.SlotFallbackExample.HeroWithFallbackContent
  alias SurfaceSiteWeb.Slots.SlotPropsExample.Rating

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
                  <li class="is-active"><Link to="#" label="Slots" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Slots

                Slots are **placeholders** declared by a component that you can fill up with **custom content**.

                In order to declare a slot, you must use the `slot` macro:

                > _**slot** name, options_

                Where:

                  * `name` - is the name of the slot.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the slot as required. Default is `false`.
                  * `arg` - an atom or map defining the type of the argument that will be passed to the associated slotable content.
                  * `as` - defines the slot assign name. Useful if you want to reuse the slot name as a prop.
                  * `generator_prop` - property that will be used as generator for this slot.

                ## Rendering content with `<#slot>`

                Slots are similar to properties as they are exposed as part of the component's **public API**.
                The main difference is that while properties are passed as attributes, slots are injected inside
                the component's body.

                To declare a `slot`, you must use the `slot` macro and provide a name to the slot.
                In the example below, the slot `default` is declared as required.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Slots.DeclaredSlotExample}
                line_range={4..19}
                show_line_numbers
                selected_lines="5,11"
              />

              <#Markdown>
              The user can now use the `<Hero>` component and fill it with custom content.
              </#Markdown>

              <#LiveExample>
                <Hero>
                  My Custom Content
                </Hero>
              </#LiveExample>

              <#Markdown>
                If the user tries to use the `Hero` component without defining any content, a
                `missing required slot "default"` error will be raised at compile-time.

                ![Missing required slot](/images/slots_required_slot_error.png)

                ## Fallback content

                Sometimes it’s useful to specify a fallback content that should be rendered when no content
                is provided for a slot.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Slots.SlotFallbackExample}
                line_range={4..21}
                show_line_numbers
                selected_lines="12"
              />

              <#Markdown>
                If at least one child element is defined inside `<#slot>...</#slot>`, the inner content is used as the default content for that slot.
                Note that we removed the `required` option in the `slot` declaration. If we had not done so,
                a warning would inform you that the fallback content would have no effect, thanks to the compiler!
              </#Markdown>

              <#LiveExample>
                <HeroWithFallbackContent />
              </#LiveExample>

              <#Markdown>
                ## Named slots

                In the previous example, we defined a component with a single default slot. But what
                if you need to define multiple slots? A classical example of such requirement is the `Card`
                component. A card usually has three distinct areas, a **header**, a **footer** and the
                main **content**.

                In order to create a component that can represent a card, we need to use **named slots**. Let's take a look at
                how it works.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.NamedSlotsExample.Example />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Slots.NamedSlotsExample}
                    line_range={39..60}
                    show_line_numbers
                    selected_lines="7-9, 15-18"
                  />
                </footer>
              </div>

              <#Markdown>
                As you can see in the example, we are assigning 3 slots:
                - The header slot
                - The default slot that contains everything that is not in any other slot
                - The footer slot

                And finally our `Card` component defining all three slots:
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Slots.NamedSlotsExample}
                line_range={4..35}
                show_line_numbers
              />

              <#Markdown>
                > **Note**: Pay attention that defining a `<#slot />` without a name is the same as defining it as `<#slot {@default} />`.

                ### Detecting optional slots

                If you need to conditionally render some content depending on whether an optional slot is defined or not,
                you can use `slot_assigned?/1`.
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.Slots.SlotDefinedExample.HeroWithOptionalFooter}
                show_line_numbers
                line_range={4..25}
                selected_lines="16-18"
              />

              <#Markdown>
                Without assigning the slot:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.SlotDefinedExample.SlotDefinedNoFooterExample />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="surface"
                    module={SurfaceSiteWeb.Slots.SlotDefinedExample.SlotDefinedNoFooterExample}
                    show_line_numbers
                    line_range={34..36}
                  />
                </footer>
              </div>

              <#Markdown>
                Assigning the slot:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.SlotDefinedExample.SlotDefinedFooterExample />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="surface"
                    module={SurfaceSiteWeb.Slots.SlotDefinedExample.SlotDefinedFooterExample}
                    show_line_numbers
                    line_range={46..51}
                    selected_lines="3-5"
                  />
                </footer>
              </div>

              <#Markdown>
                ## Typed slotables

                Instead of using `<:slot>`, you might want to define a custom component to
                hold the slot's content. In our case, we can define a `<Footer>` and a `<Header>`
                component, setting the `:slot` option as the name of the slot in the parent card.
              </#Markdown>

              <#Code language="elixir" module={SurfaceSiteWeb.Slots.TypedSlotsExample} line_range={37..43} />

              <#Markdown>
                To use them, we don't have to change anything in the `Card` component. We just need to replace each `<:slot>`
                with the appropriate `Footer` or `Header` component.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.TypedSlotsExample.Example />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Slots.TypedSlotsExample}
                    show_line_numbers
                    line_range={47..67}
                    selected_lines="7-9, 14-17"
                  />
                </footer>
              </div>

              <#Markdown>
                One benefit of using typed slotables is that you can define properties for them just like you'd do for
                any other component, allowing the user to pass extra information to customize the rendering.

                The `<Footer>` and `<Header>` components above are called "Renderless Slotables" as they don't implement
                the `render/1` callback. A renderless slotable is mostly used when you just need a declarative way to
                assign slot contents along with some additional properties. The slotable, however, is not responsible
                for any kind of rendering as this task is fully delegated to the **parent component**.

                More details and a more elaborate example is presented in the [Renderless Slotables](/slots#renderless-components)
                section later on.

                ## Implementing `render/1`

                By implementing the `render/1` callback, you can customize the content of the slot with extra markup,
                allowing users to apply a different behaviour or look for the same slot.

                For example, you could have different headers for the `Card` component.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.TypedSlotsExample.FancyHeaderExample />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.Slots.TypedSlotsExample}
                    show_line_numbers
                    line_range={69..103}
                    selected_lines="6-11, 20-22"
                  />
                </footer>
              </div>

              <#Markdown>
                ## Slot arguments

                There are cases when it's necessary to pass information from the child's scope to
                the corresponding slot content that is being injected by the parent. Using **slot arguments**, Surface
                gives you an extra layer of encapsulation as it allows you to expose only the pieces
                of data that the parent needs, keeping everything else in the child's scope private
                to the parent.

                Imagine you're developing a new component that you need to show some ratings.
                It should provide predefined buttons to increment/decrement its value but you want
                to make the rendering of the value itself customizable so you can, let's say, show
                it as a number in one page and as a list of stars in another. You also want to
                define a property for the `max` value.

                Let's see the code:
              </#Markdown>

              <#Code language="elixir" module={SurfaceSiteWeb.Slots.SlotPropsExample} line_range={2..39} />

              <#Markdown>
                Now let's create two instances of our `Rating` component, each one rendering its
                value differently.
              </#Markdown>

              <#LiveExample>
                <Rating :let={value: value} id="rating_1">
                  <h1 class="title is-marginless">
                    Rating: {value}
                  </h1>
                </Rating>
              </#LiveExample>

              <br>

              <div class="slots-page-props-example">
                <#LiveExample>
                  <Rating :let={value: value, max: max} id="rating_2">
                    {#for i <- 1..max}
                      <span class={:icon, "has-text-warning": i <= value}>
                        <i class="fas fa-star" />
                      </span>
                    {/for}
                  </Rating>
                </#LiveExample>
              </div>

              <#Markdown>
                ## Renderless components

                There are cases when you don't need to render any of the children of a specific component.
                You just want to use them as a list of values that can be retrieved so you can provide a more
                declarative way to configure that component.

                Imagine you want to define a `Grid` component but instead of defining a property to pass
                the columns definitions, you want to extract that information directly from the component's body.
                In order to achieve that, you can define a `Column` component and use the `:slot` option to
                inform that any instance will be bound to a parent slot.

                By doing that, the component will no longer be rendered automatically. The list of children
                belonging to the same slot will be grouped and become available to the parent as an **assign**.
                The parent then decides what should be done with each individual group (slot).

                Here's an example:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.GettingStarted.RenderlessComponent.Example id="renderless_component" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.GettingStarted.RenderlessComponent}
                    show_line_numbers
                    line_range={42..-3}
                    selected_lines="26-28"
                  />
                </footer>
              </div>

              <#Markdown>
                Here are the `Grid` and `Column` components:
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.GettingStarted.RenderlessComponent.Example}
                show_line_numbers
                line_range={2..40}
                selected_lines="2, 15"
              />

              <#Markdown>
                By defining a named slot `cols`, we instruct Surface to create a new assign named
                `@cols` that will hold a list containing all children that belong to the slot `cols`.

                > **Note**: As you can see, the `Column` component does not render anything. It just holds the
                provided values for its properties. All the rendering is done by the parent `Grid`.

                ## Slot generators

                Imagine that instead of passing the field related to the column,
                you want to define some markup that should be rendered for each column. This would
                give us much more flexibility to render the items. Here's an example of what we could do.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators.Example id="binding_slot_args_to_generators" />
                </div>
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators}
                    show_line_numbers
                    line_range={58..-4}
                  />
                </footer>
              </div>

              <#Markdown>
                Notice that we're not passing a regular list to the property `items` anymore, instead, we are
                passing a **generator** that defines a variable called `album`. That variable will hold
                the value of each item in the list that will be passed back to the column's scope by the
                parent `Grid`.

                > **Note**: Currently, Surface only support generators defining a single variable. Optional
                filter expressions are also supported. The concept of **generators** and **filters** is the
                same used by **comprehensions** in Elixir. For more information, see the section
                [Generators and filters](https://elixir-lang.org/getting-started/comprehensions.html#generators-and-filters)
                in the Elixir official documentation.

                Here's the updated version of the `Column` and `Grid` components:
              </#Markdown>

              <#Code
                language="elixir"
                module={SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators.Example}
                line_range={2..40}
                show_line_numbers
                selected_lines="15,31"
              />

              <#Markdown>
                Let's take a closer look at the two important changes we made in our `Grid`:

                  1. The `cols` slot now references `items` as the `generator_prop`.

                  2. We use `<#slot>` to render each column's content passing the current item as the `generator_value`.

                > **Note**: Surface Slots are implemented as regular [LiveView Slots](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#module-slots).
                The `<#slot>` component is basically a wrapper around `render_slot/2` that allows extended features like contexts and generators.
                For instance `<#slot {@default, @form} />` is analogous to `render_slot(@inner_block, @form)`.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/events">
                ← Events
              </LiveRedirect>
              <LiveRedirect to="/state_management">
                State Management →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
