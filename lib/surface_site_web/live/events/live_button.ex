defmodule SurfaceSiteWeb.Events.LiveButton.Button do
  use Surface.Component

  prop label, :string
  prop click, :event, required: true
  prop kind, :string, default: "is-info"

  slot default

  def render(assigns) do
    ~H"""
    <button type="button" class="button {{ @kind }}" :on-click={{ @click }}>
      <slot>{{ @label }}</slot>
    </button>
    """
  end
end

defmodule SurfaceSiteWeb.Events.LiveButton do
  use Surface.LiveComponent
  alias __MODULE__.Button

  data status, :string, default: "Not clicked :("

  def render(assigns) do
    ~H"""
    <div>
      <p>Status: {{ @status }}</p>
      <Button label="Click!" click="clicked" />
      <Button label="Reset" kind="is-danger" click="reset" />
    </div>
    """
  end

  def handle_event("clicked", _, socket) do
    {:noreply, assign(socket, :status, "Clicked!")}
  end

  def handle_event("reset", _, socket) do
    {:noreply, assign(socket, :status, "Not clicked :(")}
  end
end
