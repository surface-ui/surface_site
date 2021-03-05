defmodule SurfaceSiteWeb.StateManagement.ReadmeExample do
  # A functional steteless component

  defmodule Button do
    use Surface.Component

    prop click, :event
    prop kind, :string, default: "is-info"

    slot default

    def render(assigns) do
      ~H"""
      <button class="button {{ @kind }}" phx-click={{ @click }} style="margin: 0px 5px">
        <slot />
      </button>
      """
    end
  end

  # A live steteful component

  defmodule Dialog do
    use Surface.LiveComponent

    prop title, :string, required: true

    data show, :boolean

    slot default

    def mount(socket) do
      {:ok, assign(socket, show: false)}
    end

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
            <Button click="hide">Ok</Button>
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

  # A live view component

  defmodule Example do
    use Surface.LiveView

    alias SurfaceSiteWeb.Components.Button

    def render(assigns) do
      ~H"""
      <Dialog title="Alert" id="dialog">
        This <b>Dialog</b> is a stateful component. Cool!
      </Dialog>

      <Button click="show_dialog">Click to open the dialog</Button>
      """
    end

    def handle_event("show_dialog", _, socket) do
      Dialog.show("dialog")
      {:noreply, socket}
    end
  end

  defmodule DirectiveExample do
    use Surface.Component

    prop items, :list
    prop showHeader, :boolean, default: true

    def render(assigns) do
      ~H"""
      <div>
        <div class="header" :if={{ @showHeader }}>
          The Header
        </div>
        <ul>
          <li :for={{ item <- @items }}>
            {{ item }}
          </li>
        </ul>
      </div>
      """
    end
  end
end

# # For the send_update/2 example:

#   def handle_event("show_dialog", _, socket) do
#     send_update(Dialog, id: "dialog", show: true)
#     {:noreply, socket}
#   end

# #
