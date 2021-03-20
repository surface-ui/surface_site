defmodule SurfaceSiteWeb.Components.ComponentInfo do
  use Surface.Component

  alias SurfaceSiteWeb.Components.{Markdown, SectionSeparator, ComponentAPI}

  @doc "The component module"
  prop module, :module, required: true

  @doc "The title"
  prop title, :string

  @doc "The component module"
  prop examplesPosition, :atom,
    default: :after_docs,
    values: [
      :after_docs,
      :before_docs
    ]

  @doc "The examples for the component"
  slot examples

  def render(assigns) do
    prefix = if assigns.module.component_type == Surface.MacroComponent, do: "#", else: ""

    module_name =
      assigns.module
      |> Module.split()
      |> List.last()

    full_module_name = String.replace_prefix(module_name, "", prefix)

    {module_summary, module_doc} = fetch_module_doc(assigns.module)

    id = "ComponentInfo_#{module_name}"

    ~H"""
    <div id={{ id }} class="ComponentInfo">
      <h1 class="title">{{ @title || full_module_name }}</h1>
      {{ String.trim_trailing(module_summary || "", ".") |> Markdown.to_html(class: "subtitle") }}
      <hr>
      <div :if={{ @examplesPosition == :before_docs }}>
        <slot name="examples" />
      </div>
      {{ module_doc |> Markdown.to_html() }}
      <div :if={{ @examplesPosition == :after_docs }}>
        <hr :if={{ module_doc not in [nil, ""] }}>
        <slot name="examples" />
      </div>
      <hr :if={{ assigns[:examples] }}>
      <SectionSeparator title="Public API" id="{{ module_name }}-API" />
      <ComponentAPI module={{ @module }} />
    </div>
    """
  end

  defp fetch_module_doc(module) do
    case Code.fetch_docs(module) do
      {:docs_v1, _, _, "text/markdown", %{"en" => doc}, _, _} ->
        parts =
          String.split(doc, ["## Examples", "### Properties"])
          |> List.first()
          |> String.split("\n\n", parts: 2)

        {Enum.at(parts, 0), Enum.at(parts, 1)}

      _ ->
        {nil, nil}
    end
  end
end
