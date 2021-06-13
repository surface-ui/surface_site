defmodule SurfaceSiteWeb.Properties.Example02 do
  defmodule MyButton do
    use Surface.Component

    prop loading, :boolean
    prop rounded, :boolean

    slot default

    def render(assigns) do
      ~F"""
      <button class={"button", "is-info", "is-loading": @loading, "is-rounded": @rounded}>
        <#slot />
      </button>
      """
    end
  end

  defmodule Example do
    use Surface.LiveView

    data loading, :boolean, default: false
    data rounded, :boolean, default: false

    def render(assigns) do
      ~F"""
      <div>
        <MyButton loading={@loading} rounded={@rounded}>
          Change my style!
        </MyButton>
        <form phx-change="check_changed" style="margin-top: 30px">
          <label class="checkbox">
            <input type="checkbox" name="loading" checked={@loading}>
            Loading
          </label>
          <label class="checkbox" style="margin-left: 20px">
            <input type="checkbox" name="rounded" checked={@rounded}>
            Rounded
          </label>
        </form>
      </div>
      """
    end

    def handle_event("check_changed", value, socket) do
      socket =
        socket
        |> assign(:loading, Map.has_key?(value, "loading"))
        |> assign(:rounded, Map.has_key?(value, "rounded"))

      {:noreply, socket}
    end
  end

  # defp interpolation(assigns) do
  #   ~F"""

  # <!-- DON'T DO THIS!!! -->

  # <div>
  #   {if @condition do}
  #     <span>It's true!</span>
  #   {else}
  #     <span>It's false!</span>
  #   {end}
  # <div>

  #   """
  # end
end
