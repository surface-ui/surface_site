defmodule SurfaceSiteWeb.Events.LiveButton do
  defmodule Button do
    use Surface.Component

    prop label, :string
    prop click, :event, required: true
    prop kind, :string, default: "is-info"

    slot default

    def render(assigns) do
      ~F"""
      <button type="button" class={"button", @kind} :on-click={@click}>
        <#slot>{@label}</#slot>
      </button>
      """
    end
  end

  defmodule Example do
    use Surface.LiveComponent

    data count, :integer, default: 0

    def render(assigns) do
      ~F"""
      <div>
        <p>Clicked <strong>{@count}</strong> time(s)</p>
        <Button label="Click!" click="clicked" />
        <Button label="Reset" kind="is-danger" click="reset" />
      </div>
      """
    end

    def handle_event("clicked", _, socket) do
      {:noreply, update(socket, :count, &(&1 + 1))}
    end

    def handle_event("reset", _, socket) do
      {:noreply, assign(socket, :count, 0)}
    end
  end
end
