defmodule SurfaceSiteWeb.Slots.TypedSlotsExample do
  # Defining the component

  defmodule Card do
    use Surface.Component

    @doc "The header"
    slot header

    @doc "The footer"
    slot footer

    @doc "The main content"
    slot default

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

  defmodule Header do
    use Surface.Component, slot: "header"
  end

  defmodule Footer do
    use Surface.Component, slot: "footer"
  end

  # Using the component

  defmodule Example do
    use Surface.Component

    def render(assigns) do
      ~H"""
      <Card>
        <Header>
          A simple card component
        </Header>

        This is the same Card component but now we're using
        <strong>typed slotables</strong> instead of <strong>templates</strong>.

        <Footer>
          <a href="#" class="card-footer-item">Footer Item 1</a>
          <a href="#" class="card-footer-item">Footer Item 2</a>
        </Footer>
      </Card>
      """
    end
  end
end
