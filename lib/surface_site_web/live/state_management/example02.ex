defmodule SurfaceSiteWeb.StateManagement.Example02 do
  defmodule Button do
    use Surface.Component

    prop click, :event
    prop kind, :string, default: "is-info"

    slot default

    def render(assigns) do
      ~H"""
      <button class="button {{ @kind }}" :on-click={{ @click }} style="margin: 0px 5px">
        <slot />
      </button>
      """
    end
  end

  defmodule Dialog do
    use Surface.LiveComponent

    prop title, :string, required: true

    data show, :boolean, default: false

    slot default

    def render(assigns) do
      ~H"""
      <div class={{ "modal", "is-active": @show }} :on-window-keydown="hide" phx-key="Escape">
        <div class="modal-background" />
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">{{ @title }}</p>
          </header>
          <section class="modal-card-body">
            <slot />
          </section>
          <footer class="modal-card-foot" style="justify-content: flex-end">
            <Button click="hide" kind="is-info">Ok</Button>
          </footer>
        </div>
      </div>
      """
    end

    # Public API

    def show(dialog_id) do
      send_update(__MODULE__, id: dialog_id, show: true)
    end

    # Event handlers

    def handle_event("show", _, socket) do
      {:noreply, assign(socket, show: true)}
    end

    def handle_event("hide", _, socket) do
      {:noreply, assign(socket, show: false)}
    end
  end

  defmodule Example do
    use Surface.LiveView

    def render(assigns) do
      ~H"""
      <div>
        <Dialog title="Alert" id="dialog">
          The <b>Dialog</b> is now a stateful component. All event handlers
          were defined in the component itself. <b>Cool!</b>
        </Dialog>

        <Button click="show_dialog" kind="is-info">Click to open the new dialog</Button>
      </div>
      """
    end

    def handle_event("show_dialog", _, socket) do
      Dialog.show("dialog")
      {:noreply, socket}
    end
  end
end
