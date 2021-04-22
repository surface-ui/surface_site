defmodule SurfaceSiteWeb.Components.LiveExample do
  use Surface.MacroComponent

  alias SurfaceSiteWeb.Components.Code

  @impl true
  def expand(_attributes, [children], meta) do
    language = "surface"
    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"

    code_ast =
      Code.build_ast(children, meta,
        id: id,
        language: language,
        show_line_numbers: false
      )

    %Surface.AST.Tag{
      element: "div",
      directives: [],
      meta: meta,
      attributes: [
        %Surface.AST.Attribute{
          meta: meta,
          name: :class,
          type: :css_class,
          value: %Surface.AST.Literal{value: "card dark"}
        }
      ],
      children: [
        %Surface.AST.Tag{
          element: "div",
          directives: [],
          meta: meta,
          attributes: [
            %Surface.AST.Attribute{
              meta: meta,
              name: :class,
              type: :css_class,
              value: %Surface.AST.Literal{value: "card-content"}
            }
          ],
          children:
            children
            |> IO.iodata_to_binary()
            |> Surface.Compiler.compile(meta.line, meta.caller, meta.file)
        },
        %Surface.AST.Tag{
          element: "footer",
          directives: [],
          meta: meta,
          attributes: [
            %Surface.AST.Attribute{
              meta: meta,
              name: :class,
              type: :css_class,
              value: %Surface.AST.Literal{value: "card-footer"}
            }
          ],
          children: [code_ast]
        }
      ]
    }
  end
end
