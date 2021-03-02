defmodule SurfaceSiteWeb.Slots.DeclaredSlotExample do
  # Defining the component

  defmodule Hero do
    use Surface.Component

    @doc "The content of the Hero"
    slot default, required: true

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

  # defmodule Example do
  #   use Surface.Component

  #   def render(assigns) do
  #     ~H"""
  #     <Hero></Hero>
  #     """
  #   end
  # end
end
