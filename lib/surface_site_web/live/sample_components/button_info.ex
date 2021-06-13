defmodule SurfaceSiteWeb.SampleComponents.ButtonInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, SectionSeparator, ComponentAPI, Button}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, clickCount: 0)}
  end

  def render(assigns) do
    ~F"""
    <div>
      <h1 class="title">Button</h1>
      <h2 class="subtitle">
        The classic <strong>button</strong>, in different colors, sizes, and states
      </h2>
      <hr>
      <#Example>
        <Button>Button</Button>
      </#Example>

      <SectionSeparator id="sizes" title="Sizes" />

      <#Example direction="vertical">
        <div class="buttons">
          <Button>Default</Button>
          <Button size="small" color="info">Small</Button>
          <Button size="normal" color="primary" >Normal</Button>
          <Button size="medium" color="warning" >Medium</Button>
          <Button size="large" color="danger" >Large</Button>
        </div>
      </#Example>

      <SectionSeparator id="rounded" title="Rounded" />

      <#Example>
        <div class="buttons">
          <Button rounded>Rounded</Button>
          <Button color="info" rounded>Rounded</Button>
        </div>
      </#Example>

      <SectionSeparator id="list_of_buttons" title="List of buttons" />

      <#Example>
        <div class="buttons">
          <Button color="success">Save changes</Button>
          <Button color="info">Save and continue</Button>
          <Button color="danger">Cancel</Button>
        </div>

        <div class="buttons has-addons">
          <Button color="success" selected>Yes</Button>
          <Button>Maybe</Button>
          <Button>No</Button>
        </div>

        <div class="buttons has-addons is-centered">
          <Button>Yes</Button>
          <Button color="info" selected>Maybe</Button>
          <Button>No</Button>
        </div>

        <div class="buttons has-addons is-right">
          <Button>Yes</Button>
          <Button>Maybe</Button>
          <Button color="danger" selected>No</Button>
        </div>
      </#Example>

      <ComponentAPI module={Button} />
    </div>
    """
  end

  def handle_event("increment", _, socket) do
    {:noreply, update(socket, :clickCount, &(&1 + 1))}
  end
end
