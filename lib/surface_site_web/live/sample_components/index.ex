defmodule SurfaceSiteWeb.SampleComponents.Index do
  use Surface.LiveComponent

  alias Surface.Components.Markdown

  def render(assigns) do
    ~F"""
    <div class="component-group">
      <h1 class="title">Sample UI Components</h1>
      <h2 class="subtitle">
        A set of reusable UI components you can use as templates to create your own custom components.
      </h2>
      <hr>
      <#Markdown>
        Includes some of the most common components includng **buttons**, **tabs**, **dialogs**,
        **cards**, **table grids** and more.

        These sample components use [Bulma](https://bulma.io){: target="_blank"} for CSS styling.

        > **Note:** Feel free to adapt any of the components or examples
        > to any other CSS framework of your preference. You can use
        > [Tailwind](https://tailwindcss.com/){: target="_blank"},
        > [Bootstrap](https://getbootstrap.com/){: target="_blank"} or try them out with your
        > **own CSS styles**.

        ## Usage

        To use bulma's CSS styles, choose one of the following methods:

        ### 1. Using CDN or downloading files

        Add the following line to your `root.html.leex`:

        ```surface
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.8.0/css/bulma.min.css"/>
        ```

        Or download the `.css` file and manually add it to your `priv/static/css` folder.
        In this case, add the following line to your `root.html.leex`:

        ```surface
        <link rel="stylesheet" href={Routes.static_path(@conn, "/css/bulma.min.css")} />
        ```

        ### 2. NPM or Yarn

        Add `bulma` to the list of dependencies in `assets/package.json`:

        ```js
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
