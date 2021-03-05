defmodule SurfaceSiteWeb.Properties.Example01 do
  # Defining the component

  defmodule Hello do
    use Surface.Component

    @doc "Someone to say hello to"
    prop name, :string, required: true

    def render(assigns) do
      ~H"""
      Hello, {{ @name }}!
      """
    end
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <Hello name="John Doe" />
      """
    end
  end
end
