defmodule SurfaceSiteWeb.BuiltinComponents.Index do
  use Surface.LiveComponent

  alias Surface.Components.Markdown

  def render(assigns) do
    ~F"""
    <div class="component-group">
      <h1 class="title">Built-in Components</h1>
      <h2 class="subtitle">
        Surface provides a set of built-in components that you can use
        in any project, <strong>regardless of the CSS/JS</strong> solution you might choose.
      </h2>
      <hr>

      <#Markdown>
        ## Usage
        Built-in components are usually under the `Surface.Components` namespace and can be aliased as any other component. For instance:

        ```elixir
        defmodule MyLivePatch do
          use Surface.Component
          alias Surface.Components.LivePatch

          def render(assigns) do
            ~F"\""
            <LivePatch to="#">
              <i class="fa fa-link is-info"/>
              My link
            </LivePatch>
            "\""
          end
        end
        ```
      </#Markdown>

      <#Markdown>
        ## Available components

        > **Note:** Most of the following components just wrappers around existing Phoenix built-in helpers.

        ### Navigation

          * [Link](/builtincomponents/Link){: data-phx-link="redirect" data-phx-link-state="push"} -
            Generates a **hyperlink**.
          * [LivePatch](/builtincomponents/LivePatch){: data-phx-link="redirect" data-phx-link-state="push"} -
            Generates a link that will **patch** the current LiveView.
          * [LiveRedirect](/builtincomponents/LiveRedirect){: data-phx-link="redirect" data-phx-link-state="push"} -
            Generates a link that will **redirect** to a new LiveView.

        ### Other

          * [#Markdown](/builtincomponents/Markdown){: data-phx-link="redirect" data-phx-link-state="push"} -
            A simple macro component that converts markdown into HTML at compile-time.
          * [#Raw](/builtincomponents/Raw){: data-phx-link="redirect" data-phx-link-state="push"} -
            A macro component that does not translate any of its contents.

      </#Markdown>
    </div>
    """
  end
end
