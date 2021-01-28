defmodule SurfaceSiteWeb.BuiltinComponents.MarkdownInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Markdown

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ Markdown }} examplesPosition={{ :before_docs }}>
        <template slot="examples">
          <#Markdown unwrap>
            The `<#Markdown>` component allows users to write markdown content directly in a Surface template.
            The content will be validated and translated to HTML at **compile-time**.
          </#Markdown>
          <hr />
          <#Example language="html">
            <#Markdown class="content">
              ### Heading 3

              ## Heading 2

              # Heading 1

              ---

              _This text is italic_

              _**This text is itatic and bold**_

              ---

              ### Links

              * [Source](https://github.com/msaraiva/surface/)
              * [Docs](http://surface-demo.msaraiva.io/documentation)

              ### Tables

              | Id     | Name           | Value      |
              | -------|----------------| ----------:|
              | 1      | The first item |     $10,00 |
              | 2      | The second     |  $1.200,00 |
              | 3      | The Third      |       $130 |

              ---

              ### Lists

                1. Item 1
                2. Item 2
                  * Subitem 1
                  * Subitem 2

              ---

              > **Note**: This `markdown` text was
              > converted into `HTML` at compile-time
              > using the `#Markdown` component.
            </#Markdown>
          </#Example>
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
