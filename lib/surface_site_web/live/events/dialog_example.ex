defmodule SurfaceSiteWeb.Events.DialogExample do
  defmodule Dialog do
    use Surface.LiveComponent

    alias SurfaceSiteWeb.Events.LiveButton.Button

    prop title, :string, required: true
    prop ok_label, :string, default: "Ok"
    prop close_label, :string, default: "Close"
    prop ok_click, :event, default: "close"
    prop close_click, :event, default: "close"

    data show, :boolean, default: false

    slot default

    def render(assigns) do
      ~F"""
      <div class={"modal", "is-active": @show} :on-window-keydown={@close_click} phx-key="Escape">
        <div class="modal-background" />
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">{@title}</p>
          </header>
          <section class="modal-card-body">
            <#slot />
          </section>
          <footer class="modal-card-foot" style="justify-content: flex-end">
            <Button click={@ok_click}>{@ok_label}</Button>
            <Button click={@close_click} kind="is-danger">{@close_label}</Button>
          </footer>
        </div>
      </div>
      """
    end

    # Public API

    def open(dialog_id) do
      send_update(__MODULE__, id: dialog_id, show: true)
    end

    def close(dialog_id) do
      send_update(__MODULE__, id: dialog_id, show: false)
    end

    # Default event handlers

    def handle_event("close", _, socket) do
      {:noreply, assign(socket, show: false)}
    end
  end

  defmodule ExampleWithDefaultBehaviour do
    use Surface.LiveComponent

    alias SurfaceSiteWeb.Events.LiveButton.Button
    alias Surface.Components.Form
    alias Surface.Components.Form.{TextInput, Label, Field}

    def render(assigns) do
      ~F"""
      <div>
        <Dialog title="User form" id="form_dialog_1">
          <Form for={%{}} as={:user}>
            <Field name="name"><Label/><TextInput/></Field>
            <Field name="email"><Label/><TextInput/></Field>
          </Form>
          Clicking <strong>"Ok"</strong> or <strong>"Close"</strong>
          closes the form (default behaviour).
        </Dialog>

        <Button click="open_form">Click to open the dialog!</Button>
      </div>
      """
    end

    def handle_event("open_form", _, socket) do
      Dialog.open("form_dialog_1")
      {:noreply, socket}
    end
  end

  defmodule ExampleWithOverwrittenBehaviour do
    use Surface.LiveComponent

    alias SurfaceSiteWeb.Events.LiveButton.Button
    alias Surface.Components.Form
    alias Surface.Components.Form.{TextInput, Label, Field}

    def render(assigns) do
      ~F"""
      <div>
        <Dialog title="User form" close_click="open_confirmation_dialog" id="form_dialog_2">
          <Form for={%{}} as={:user2}>
            <Field name="name"><Label/><TextInput/></Field>
            <Field name="email"><Label/><TextInput/></Field>
          </Form>
          Now, clicking <strong>"Close"</strong> shows a confirmation dialog
          instead of closing the form.
        </Dialog>

        <Dialog
          id="confirmation_dialog"
          title="Alert"
          ok_label="Yes"
          close_label="No"
          ok_click="confirm_close_form"
          close_click="close_confirmation_dialog"
        >
          Are you sure you want to close this form?<br><br>
          <strong>Note:</strong> All information provided will be lost.
        </Dialog>

        <Button click="open_form">Click to open the dialog!</Button>
      </div>
      """
    end

    def handle_event("open_form", _, socket) do
      Dialog.open("form_dialog_2")
      {:noreply, socket}
    end

    def handle_event("open_confirmation_dialog", _, socket) do
      Dialog.open("confirmation_dialog")
      {:noreply, socket}
    end

    def handle_event("close_confirmation_dialog", _, socket) do
      Dialog.close("confirmation_dialog")
      {:noreply, socket}
    end

    def handle_event("confirm_close_form", _, socket) do
      Dialog.close("confirmation_dialog")
      Dialog.close("form_dialog_2")
      {:noreply, socket}
    end
  end
end
