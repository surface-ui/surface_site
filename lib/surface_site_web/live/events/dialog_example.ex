defmodule SurfaceSiteWeb.Events.DialogExample do
  defmodule Dialog do
    use Surface.LiveComponent

    alias SurfaceSiteWeb.Events.LiveButton.Button

    prop title, :string, required: true
    prop ok, :event
    prop close, :event, default: "hide"

    data show, :boolean, default: false

    slot default

    def render(assigns) do
      ~H"""
      <div class={{ "modal", "is-active": @show }} :on-window-keydown={{ @close }} phx-key="Escape">
        <div class="modal-background" />
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">{{ @title }}</p>
          </header>
          <section class="modal-card-body">
            <slot />
          </section>
          <footer class="modal-card-foot" style="justify-content: flex-end">
            <Button click={{ @ok }}>Ok</Button>
            <Button click={{ @close }} kind="is-danger">Close</Button>
          </footer>
        </div>
      </div>
      """
    end

    # Public API
    def show(dialog_id) do
      send_update(__MODULE__, id: dialog_id, show: true)
    end

    def hide(dialog_id) do
      send_update(__MODULE__, id: dialog_id, show: false)
    end

    # Default event handlers
    def handle_event("hide", _, socket) do
      {:noreply, assign(socket, show: false)}
    end
  end

  defmodule ExampleWithOverwrittenBehaviour do
    use Surface.LiveComponent
    alias SurfaceSiteWeb.Events.LiveButton.Button

    def render(assigns) do
      ~H"""
      <div>
        <Dialog title="Fill the form" close="hide_dialog" id="event_dialog_example_2">
          Now, click on the cancel button to see the overwritted behavior. <br>
          Nothing will happen if you click on the OK button ;)
        </Dialog>

        <Dialog
          title="Alert"
          ok="confirm_close_dialog"
          close="hide_confirmation_dialog"
          id="confirmation_dialog_example"
        >
          Are you sure you want to close this dialog? All information provided will be lost. <br>
          If you click on the "close" button, you will be redirect to the previous dialog. <br>
          If you click on the "ok" button, you will confirm that you would like to close
          the first dialog.
        </Dialog>

        <Button click="show_dialog">Click to look into action the overwritten event</Button>
      </div>
      """
    end

    def handle_event("show_dialog", _, socket) do
      Dialog.show("event_dialog_example_2")
      {:noreply, socket}
    end

    def handle_event("hide_dialog", _, socket) do
      Dialog.show("confirmation_dialog_example")
      {:noreply, socket}
    end

    def handle_event("hide_confirmation_dialog", _, socket) do
      Dialog.hide("confirmation_dialog_example")
      {:noreply, socket}
    end

    def handle_event("confirm_close_dialog", _, socket) do
      Dialog.hide("confirmation_dialog_example")
      Dialog.hide("event_dialog_example_2")
      {:noreply, socket}
    end
  end

  defmodule ExampleWithDefaultBehaviour do
    use Surface.LiveComponent

    alias SurfaceSiteWeb.Events.LiveButton.Button

    def render(assigns) do
      ~H"""
      <div>
        <Dialog title="Fill the form" id="event_dialog_example_1">
          Now, click on the close button to see close the modal.<br />
          Nothing will happen if you click on the OK button ;)
        </Dialog>

        <Button click="show_dialog">Click to look into action the default event</Button>
      </div>
      """
    end

    def handle_event("show_dialog", _, socket) do
      Dialog.show("event_dialog_example_1")
      {:noreply, socket}
    end
  end
end
