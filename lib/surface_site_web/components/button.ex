defmodule SurfaceSiteWeb.Components.Button do
  use Surface.Component

  prop click, :event
  prop kind, :string, default: "is-info"

  def render(assigns) do
    ~H"""
    <button class="button {{ @kind }}" :on-click={{ @click }} style="margin: 0px 5px">
      <slot/>
    </button>
    """
  end
end
