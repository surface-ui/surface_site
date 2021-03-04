defmodule SurfaceSiteWeb.BulmaComponents.TabsInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias SurfaceBulma.Button
  alias SurfaceBulma.Tabs
  alias SurfaceBulma.Tabs.TabItem

  data albums, :list

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ Tabs }}>
        <template slot="examples">
          <#Example>
            <Tabs id="tabs-example" boxed>

              <TabItem label="Pictures" icon="fas fa-image">
                Lorem ipsum dolor sit amet,
                <strong>consectetur</strong> adipiscing elit.
                Fusce id fermentum quam.
                <hr>
                <div class="buttons is-right">
                  <Button color="success">Yes</Button>
                  <Button color="danger">No</Button>
                </div>
              </TabItem>

              <TabItem label="Music" icon="fas fa-music">
                Fusce id fermentum quam. Proin sagittis,
                nibh id hendrerit imperdiet, elit
                <strong>sapien</strong> laoreet elit.
                <hr>
                <div class="buttons is-right">
                  <Button color="info">Ok</Button>
                  <Button color="warning">Maybe</Button>
                </div>
              </TabItem>

              <TabItem label="Videos" icon="fas fa-film">
                Lorem ipsum dolor sit amet.
              </TabItem>

            </Tabs>
          </#Example>
        </template>
      </ComponentInfo>
      <br><hr>
      <ComponentInfo module={{ TabItem }} title="Tabs.TabItem" />
    </div>
    """
  end
end
