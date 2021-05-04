defmodule SurfaceSiteWeb.Components.Example do
  use Surface.MacroComponent

  alias Surface.MacroComponent

  prop direction, :string, values: ["horizontal", "vertical"]
  prop language, :string

  @impl true
  def expand(attributes, [children], meta) do
    props = MacroComponent.eval_static_props!(__MODULE__, attributes, meta.caller)
    direction = props[:direction] || "horizontal"
    language = props[:language] || "surface"

    {:safe, content} =
      children
      |> String.replace(~r/\n    /, "\n", global: true)
      |> fix_leading_space()
      |> String.trim_trailing()
      |> Phoenix.HTML.html_escape()

    content = IO.iodata_to_binary(content)
    container_id = :erlang.unique_integer([:positive])
    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"

    %Surface.AST.Tag{
      element: "div",
      directives: [],
      meta: meta,
      attributes: [
        %Surface.AST.Attribute{
          meta: meta,
          name: :class,
          type: :css_class,
          value: %Surface.AST.Literal{value: "Example #{direction}"}
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
              value: %Surface.AST.Literal{value: "demo"}
            }
          ],
          children:
            children
            |> IO.iodata_to_binary()
            |> Surface.Compiler.compile(meta.line, meta.caller, meta.file)
        },
        %Surface.AST.Tag{
          element: "div",
          directives: [],
          meta: meta,
          attributes: [
            %Surface.AST.Attribute{
              meta: meta,
              name: :id,
              type: :string,
              value: %Surface.AST.Literal{value: container_id}
            },
            %Surface.AST.Attribute{
              meta: meta,
              name: :class,
              type: :css_class,
              value: %Surface.AST.Literal{value: "code"}
            },
            %Surface.AST.Attribute{
              meta: meta,
              name: :"phx-update",
              type: :string,
              value: %Surface.AST.Literal{value: "ignore"}
            }
          ],
          children: [
            %Surface.AST.Tag{
              element: "pre",
              directives: [],
              meta: meta,
              attributes: [],
              children: [
                %Surface.AST.Tag{
                  element: "code",
                  debug: [],
                  directives: [],
                  meta: meta,
                  attributes: [
                    %Surface.AST.Attribute{
                      meta: meta,
                      name: :id,
                      type: :string,
                      value: %Surface.AST.Literal{value: id}
                    },
                    %Surface.AST.Attribute{
                      meta: meta,
                      name: :class,
                      type: :css_class,
                      value: %Surface.AST.Literal{value: "content language-#{language}"}
                    },
                    %Surface.AST.Attribute{
                      meta: meta,
                      name: :"phx-hook",
                      type: :string,
                      value: %Surface.AST.Literal{value: "Highlight"}
                    }
                  ],
                  children: [%Surface.AST.Literal{value: content}]
                }
              ]
            }
          ]
        }
      ]
    }
  end

  defp fix_leading_space(markdown) do
    ["", first | _] = lines = String.split(markdown, "\n")
    [space] = Regex.run(~r/^\s*/, first)

    lines
    |> Enum.map(fn line -> String.replace_prefix(line, space, "") end)
    |> Enum.join("\n")
  end
end
