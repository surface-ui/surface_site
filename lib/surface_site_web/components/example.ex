defmodule SurfaceSiteWeb.Components.Example do
  use Surface.MacroComponent

  alias Surface.MacroComponent

  prop direction, :string, static: true, values: ["horizontal", "vertical"]
  prop language, :string, static: true

  @impl true
  def expand(attributes, content, meta) do
    props = MacroComponent.eval_static_props!(__MODULE__, attributes, meta.caller)
    direction = props[:direction] || "horizontal"
    language = props[:language] || "surface"

    content_html =
      content
      |> String.replace(~r/\n    /, "\n", global: true)
      |> fix_leading_space()
      |> String.trim_trailing()
      |> Phoenix.HTML.html_escape()
      |> elem(1)
      |> IO.iodata_to_binary()

    content_ast = Surface.Compiler.compile(content, meta.line, meta.caller, meta.file)

    container_id = "#{inspect(__MODULE__)}_container_#{:erlang.unique_integer([:positive])}"
    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"
    class = "Example #{direction}"
    code_class = "content language-#{language}"

    quote_surface do
      ~F"""
      <div class={^class}>
        <div class="demo">
          {^content_ast}
        </div>
        <div id={^container_id} class="code" phx-update="ignore">
          <pre>
            <code id={^id} class={^code_class} phx-hook="Highlight">{^content_html}</code>
          </pre>
        </div>
      </div>
      """
    end
  end

  defp fix_leading_space(markdown) do
    ["", first | _] = lines = String.split(markdown, "\n")
    [space] = Regex.run(~r/^\s*/, first)

    lines
    |> Enum.map(fn line -> String.replace_prefix(line, space, "") end)
    |> Enum.join("\n")
  end
end
