defmodule SurfaceSiteWeb.ComponentsBasics.Example01 do
  # Defining the component

  defmodule Hello do
    use Surface.Component

    def render(assigns) do
      ~H"""
      Hello, I'm a component!
      """
    end
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <Hello />
      """
    end
  end
end
