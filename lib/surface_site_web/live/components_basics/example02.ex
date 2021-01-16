defmodule SurfaceSiteWeb.ComponentsBasics.Example02 do
  defmodule Button do
    use Surface.Component

    @doc "The type (color) of the button"
    prop type, :string, values: ["primary", "success", "info"]

    @doc "The Button is expanded (full-width)"
    prop expanded, :boolean, default: false

    @doc "Triggers on click"
    prop click, :event

    @doc "Triggers on focus"
    prop focus, :event

    @doc "The content of the button"
    slot default, required: true

    def render(_assigns) do
      # ...
    end
  end
end
