defmodule SurfaceSiteWeb.BulmaComponents.TableInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias SurfaceBulma.Table
  alias SurfaceBulma.Table.Column

  data albums, :list

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       albums: [
         %{name: "The Dark Side of the Moon", artist: "Pink Floyd", released: "March 1, 1973"},
         %{name: "OK Computer", artist: "Radiohead", released: "June 16, 1997", selected: true},
         %{name: "Disraeli Gears", artist: "Cream", released: "November 2, 1967"},
         %{name: "Physical Graffiti", artist: "Led Zeppelin", released: "February 24, 1975"}
       ]
     )}
  end

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ Table }}>
        <template slot="examples">
          <#Example direction="vertical">
            <Table data={{ album <- @albums }} rowClass={{ &rowClass/2 }} bordered>
              <Column label="Album">
                {{ album.name }}
              </Column>
              <Column label="Released">
                {{ album.released }}
              </Column>
              <Column label="Artist">
                <a href="#">{{ album.artist }}</a>
              </Column>
            </Table>
          </#Example>
        </template>
      </ComponentInfo>
      <br /><hr />
      <ComponentInfo module={{ Column }} title="Table.Column" />
    </div>
    """
  end

  defp rowClass(item, _index) do
    if item[:selected] do
      "is-selected"
    else
      ""
    end
  end
end
