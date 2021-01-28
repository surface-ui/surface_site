defmodule SurfaceSiteWeb.Components.Hero do
  use Surface.Component

  def render(assigns) do
    ~H"""
    <section class="hero is-info">
      <div class="hero-body" style="padding: 2.5rem 1.5rem">
        <slot />
      </div>
    </section>
    """
  end
end
