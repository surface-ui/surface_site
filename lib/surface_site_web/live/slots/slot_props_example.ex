defmodule SurfaceSiteWeb.Slots.SlotPropsExample do
  defmodule Rating do
    use Surface.LiveComponent

    @doc "The maximum value"
    prop max, :integer, default: 5

    @doc "The content"
    slot default, args: [:value, :max]

    data value, :integer, default: 1

    def render(assigns) do
      ~F"""
      <div>
        <p>
          <#slot :args={value: @value, max: @max} />
        </p>
        <div style="padding-top: 10px;">
          <button class="button is-info" :on-click="dec" disabled={@value == 1}>
            -
          </button>
          <button class="button is-info" :on-click="inc" disabled={@value == @max}>
            +
          </button>
        </div>
      </div>
      """
    end

    def handle_event("inc", _, socket) do
      {:noreply, update(socket, :value, &(&1 + 1))}
    end

    def handle_event("dec", _, socket) do
      {:noreply, update(socket, :value, &(&1 - 1))}
    end
  end

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~F"""
      <div>
        <Rating :let={value: value} id="rating_1">
          <h1 class="title is-marginless">
            Rating: {value}
          </h1>
        </Rating>
        <hr>
        <Rating :let={value: value, max: max} id="rating_2">
          <div>
            <span :for={i <- 1..max} class={:icon, "has-text-warning": i <= value}>
              <i class="fas fa-star" />
            </span>
          </div>
        </Rating>
      </div>
      """
    end
  end
end
