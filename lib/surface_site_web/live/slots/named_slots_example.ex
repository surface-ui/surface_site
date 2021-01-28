defmodule SurfaceSiteWeb.Slots.NamedSlotsExample do
  # Defining the component

  defmodule Card do
    use Surface.Component

    @doc "The header"
    slot header

    @doc "The footer"
    slot footer

    @doc "The main content"
    slot default, required: true

    def render(assigns) do
      ~H"""
      <div class="card">
        <header class="card-header" style="background-color: #f5f5f5">
          <p class="card-header-title">
            <slot name="header" />
          </p>
        </header>
        <div class="card-content">
          <div class="content">
            <slot />
          </div>
        </div>
        <footer class="card-footer" style="background-color: #f5f5f5">
          <slot name="footer" />
        </footer>
      </div>
      """
    end
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <Card>
        <template slot="header">
          A simple card component
        </template>
        This example demonstrates how to create components with multiple slots.
        It defines a
        <strong>default</strong>
        slot to hold the card's content
        and two
        <strong>named slots</strong>: header and footer.
        <template slot="footer">
          <a href="#" class="card-footer-item">Footer Item 1</a>
          <a href="#" class="card-footer-item">Footer Item 2</a>
        </template>
      </Card>
      """
    end
  end
end
