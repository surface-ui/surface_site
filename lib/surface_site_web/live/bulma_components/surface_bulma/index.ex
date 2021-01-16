defmodule SurfaceSiteWeb.BulmaComponents.Index do
  use Surface.LiveComponent

  alias Surface.Components.Markdown

  def render(assigns) do
    ~H"""
    <div class="component-group">
      <h1 class="title">UI Components (WIP)</h1>
      <h2 class="subtitle">
        A suite of <strong>reusable</strong> UI components that can be used directly in your projects
      </h2>
      <hr>
      <#Markdown>
        Includes some of the most common components includng **buttons**, **tabs**, **dialogs**,
        **cards**, **table grids** and more.

        This suite uses [Bulma](https://bulma.io){: target="_blank"} for CSS styling.
        Bulma it's a free, open source, responsive **CSS** framework with
        **no JS dependencies**, which makes it a perfect fit to use with **Phoenix LiveView**.

        Source code can be found at: [github.com/msaraiva/surface_bulma](https://github.com/msaraiva/surface_bulma).

        > **Note:** Feel free to adapt any of the components or examples
        > to any other CSS framework of your preference. You can use
        > [Tailwind](https://tailwindcss.com/){: target="_blank"},
        > [Bootstrap](https://getbootstrap.com/){: target="_blank"} or try them out with your
        > **own CSS styles**.

        ## Usage

        Add `surface_bulma` to the list of dependencies in `mix.exs`:

        ```
        def deps do
          [
            ...
            {:surface_bulma, github: "msaraiva/surface_bulma"}
          ]
        end
        ```

        To use bulma's CSS styles, choose one of the following methods:

        ### 1. Using CDN or downloading files

        Add the following line to your `layout_view.ex`:

        ```
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.0/css/bulma.min.css" />
        ```

        Or download the `.css` file and manually add it to your `priv/static/css` folder.
        In this case, add the following line to your `layout_view.ex`:

        ```
        <link rel="stylesheet" href={{ Routes.static_path(@conn, "/css/bulma.min.css") }} />
        ```

        ### 2. NPM or Yarn

        Add `bulma` to the list of dependencies in `assets/package.json`:

        ```
        "dependencies": {
          ...
          "bulma": "0.8.0"
        }
        ```
        </#Markdown>
    </div>
    """
  end
end
