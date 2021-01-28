defmodule SurfaceSiteWeb.Components.SectionSeparator do
  use Surface.Component

  prop id, :string
  prop title, :string

  def render(assigns) do
    ~H"""
    <h3 id={{ @id }} class="title is-4 is-spaced">
      <a href={{ "##{@id}" }}>#</a>
      {{ @title }}
    </h3>
    """
  end
end
