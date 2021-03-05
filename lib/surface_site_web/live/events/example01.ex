defmodule SurfaceSiteWeb.Events.Example01 do
  defmodule MyButton do
    use Surface.Component

    @doc "Triggers on click"
    prop click, :event

    slot default

    def render(assigns) do
      ~H"""
      <button class="button" :on-click={{ @click }}>
        <slot />
      </button>
      """
    end
  end
end
