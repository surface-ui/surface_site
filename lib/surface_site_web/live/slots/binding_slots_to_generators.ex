defmodule SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators do
  defmodule Column do
    use Surface.Component, slot: "cols"

    @doc "The title of the column"
    prop title, :string, required: true
  end

  defmodule Grid do
    use Surface.Component

    @doc "The list of items to be rendered"
    prop items, :list, required: true

    @doc "The list of columns defining the Grid"
    slot cols, props: [item: ^items]

    def render(assigns) do
      ~H"""
      <table class="table is-bordered is-striped is-hoverable is-fullwidth">
        <thead>
          <tr>
            <th :for={{ col <- @cols }}>
              {{ col.title }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr :for={{ item <- @items }} class={{ "is-selected": item[:selected] }}>
            <td :for.index={{ @cols }}>
              <slot name="cols" index={{ index }} :props={{ item: item }} />
            </td>
          </tr>
        </tbody>
      </table>
      """
    end
  end

  defmodule Example do
    use Surface.Component

    data albums, :list

    def mount(socket) do
      albums = [
        %{name: "The Dark Side of the Moon", artist: "Pink Floyd", released: "March 1, 1973"},
        %{name: "OK Computer", artist: "Radiohead", released: "June 16, 1997"},
        %{name: "Disraeli Gears", artist: "Cream", released: "November 2, 1967", selected: true},
        %{name: "Physical Graffiti", artist: "Led Zeppelin", released: "February 24, 1975"}
      ]

      {:ok, assign(socket, albums: albums)}
    end

    def render(assigns) do
      ~H"""
      <div>
        <Grid items={{ album <- @albums }}>
          <Column title="Title">
            {{ album.name }} (Released: <strong>{{ album.released }}</strong>)
          </Column>
          <Column title="Artist">
            <a href="#">{{ album.artist }}</a>
          </Column>
        </Grid>
      </div>
      """
    end
  end
end
