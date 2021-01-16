defmodule SurfaceSiteWeb.Events.SurfaceCounter do
  defmodule Counter do
    use Surface.LiveComponent

    data count, :integer, default: 0

    def render(assigns) do
      ~H"""
      <div>
        <h1 class="title">
          {{ @count }}
        </h1>
        <div>
          <button class="button is-info" :on-click="dec">-</button>
          <button class="button is-info" :on-click="inc">+</button>
          <button class="button is-danger" :on-click="reset">Reset</button>
        </div>
      </div>
      """
    end

    #   # Event handlers
    #   ...
    # end

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
