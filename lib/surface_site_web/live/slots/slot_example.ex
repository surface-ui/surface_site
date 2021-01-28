defmodule SurfaceSiteWeb.Slots.SlotExample do
  # Defining the component

  defmodule Hero do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <section class="hero is-info">
        <div class="hero-body">
          <slot />
        </div>
      </section>
      """
    end
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <Hero>
        This content was wrapped by a Hero!
      </Hero>
      """
    end
  end
end
