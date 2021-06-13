defmodule SurfaceSiteWeb.Components.LiveExample do
  use Surface.MacroComponent

  alias SurfaceSiteWeb.Components.Code

  @impl true
  def expand(_attributes, content, meta) do
    language = "surface"
    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"

    code_ast = Code.build_ast(content, meta, id: id, language: language, show_line_numbers: false)
    content_ast = Surface.Compiler.compile(content, meta.line, meta.caller, meta.file)

    quote_surface do
      ~F"""
      <div class="card dark">
        <div class="card-content">
          {^content_ast}
        </div>
        <footer class="card-footer">
          {^code_ast}
        </footer>
      </div>
      """
    end
  end
end
