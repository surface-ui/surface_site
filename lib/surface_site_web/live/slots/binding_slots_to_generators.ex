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
    slot cols, args: [item: ^items]

    def render(assigns) do
      ~F"""
      <table class="table is-bordered is-striped is-hoverable is-fullwidth">
        <thead>
          <tr>
            {#for col <- @cols}
              <th>{col.title}</th>
            {/for}
          </tr>
        </thead>
        <tbody>
          {#for item <- @items}
            <tr class={"is-selected": item[:selected]}>
              {#for {_, index} <- Enum.with_index(@cols)}
                <td><#slot name="cols" index={index} :args={item: item} /></td>
              {/for}
            </tr>
          {/for}
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
      ~F"""
      <div>
        <Grid items={album <- @albums}>
          <Column title="Title">
            {album.name} (Released: <strong>{album.released}</strong>)
          </Column>
          <Column title="Artist">
            <a href="#">{album.artist}</a>
          </Column>
        </Grid>
      </div>
      """
    end
  end
end
