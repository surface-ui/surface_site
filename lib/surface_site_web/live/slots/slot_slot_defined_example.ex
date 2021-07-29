defmodule SurfaceSiteWeb.Slots.SlotDefinedExample do
  # Defining the component

  defmodule HeroWithOptionalFooter do
    use Surface.Component

    @doc "The content of the Hero"
    slot default

    @doc "An optional footer"
    slot footer

    def render(assigns) do
      ~F"""
      <section class="hero is-info">
        <div class="hero-body">
          <#slot />
        </div>
        <div :if={slot_assigned?(:footer)} style="padding:5px; border-top:2px solid #f5f5f5;">
          <#slot name="footer" />
        </div>
      </section>
      """
    end
  end

  # Using the component

  defmodule SlotDefinedNoFooterExample do
    use Surface.Component

    def render(assigns) do
      ~F"""
      <HeroWithOptionalFooter>
        <p>Hello! No footer for me.</p>
      </HeroWithOptionalFooter>
      """
    end
  end

  defmodule SlotDefinedFooterExample do
    use Surface.Component

    def render(assigns) do
      ~F"""
      <HeroWithOptionalFooter>
        <p>Hello! Check out the footer.</p>
        <:footer>
          <p>&copy;2021</p>
        </:footer>
      </HeroWithOptionalFooter>
      """
    end
  end
end
