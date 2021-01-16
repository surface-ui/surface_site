defmodule SurfaceSiteWeb.Events.Example01 do
  defmodule MyButton do
    use Surface.Component

    @doc "Triggers on click"
    prop click, :event

    def render(_assigns) do
    end

    # def render(assigns) do
    #   ...
    # end
  end
end
