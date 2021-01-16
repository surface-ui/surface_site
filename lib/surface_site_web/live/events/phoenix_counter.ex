defmodule SurfaceSiteWeb.Events.PhoenixCounter do
  defmodule Counter do
    use Phoenix.LiveComponent

    def mount(socket) do
      {:ok, assign(socket, count: 0)}
    end

    def render(assigns) do
      ~L"""
      <div>
        <h1 class="title">
          <%= @count %>
        </h1>
        <div>
          <button class="button is-info" phx-click="dec" phx-target="<%= @myself %>">-</button>
          <button class="button is-info" phx-click="inc" phx-target="<%= @myself %>">+</button>
          <button class="button is-danger" phx-click="reset" phx-target="<%= @myself %>">Reset</button>
        </div>
      </div>
      """
    end

    def handle_event("inc", _, socket) do
      {:noreply, update(socket, :count, &(&1 + 1))}
    end

    def handle_event("dec", _, socket) do
      {:noreply, update(socket, :count, &(&1 - 1))}
    end

    def handle_event("reset", _, socket) do
      {:noreply, assign(socket, :count, 0)}
    end
  end
end
