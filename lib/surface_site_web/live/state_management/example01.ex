defmodule SurfaceSiteWeb.StateManagement.Example01 do
  defmodule Button do
    use Surface.Component

    prop click, :event
    prop kind, :string, default: "is-info"

    slot default

    def render(assigns) do
      ~H"""
      <button class="button {{ @kind }}" :on-click={{ @click }}>
        <slot />
      </button>
      """
    end
  end

  defmodule Dialog do
    use Surface.Component

    prop title, :string, required: true
    prop show, :boolean, required: true
    prop hideEvent, :event, required: true

    slot default

    def render(assigns) do
      ~H"""
      <div class={{ "modal", "is-active": @show }}>
        <div class="modal-background" />
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">{{ @title }}</p>
          </header>
          <section class="modal-card-body">
            <slot />
          </section>
          <footer class="modal-card-foot" style="justify-content: flex-end">
            <Button click={{ @hideEvent }}>Ok</Button>
          </footer>
        </div>
      </div>
      """
    end
  end

  defmodule Example do
    use Surface.LiveView

    data show_dialog, :boolean, default: false

    def render(assigns) do
      ~H"""
      <Dialog title="Alert" show={{ @show_dialog }} hideEvent="hide_dialog">
        The <b>Dialog</b> is a stateless component. All event handlers
        had to be defined in the parent <b>LiveView</b>.
      </Dialog>

      <Button click="show_dialog">Click to open</Button>
      """
    end

    def handle_event("show_dialog", _, socket) do
      {:noreply, assign(socket, show_dialog: true)}
    end

    def handle_event("hide_dialog", _, socket) do
      {:noreply, assign(socket, show_dialog: false)}
    end
  end
end
