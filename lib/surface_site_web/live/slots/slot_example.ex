defmodule SurfaceSiteWeb.Slots.SlotExample do
  # Defining the component

  defmodule Hero do
    use Surface.Component

    slot default

    def render(assigns) do
      ~F"""
      <section class="hero is-info">
        <div class="hero-body">
          <#slot />
        </div>
      </section>
      """
    end
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~F"""
      <Hero>
        This content was wrapped by a Hero!
      </Hero>
      """
    end
  end

  defmodule SlotAssignedExample do
    use Surface.Component

    slot header

    def render(assigns) do
      ~F"""
      <div :if={{ slot_assigned?(:header) }}>
        <#slot name="header"/>
      </div>
      """
    end
  end
end
