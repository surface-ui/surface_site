defmodule SurfaceSiteWeb.Components.Code do
  use Surface.MacroComponent

  alias Surface.MacroComponent

  prop language, :string
  prop file, :string
  prop module, :module
  prop line_range, :range
  prop show_line_numbers, :boolean
  # :range | :integer
  prop selected_lines, :any

  @impl true
  def expand(attributes, children, meta) do
    props = MacroComponent.eval_static_props!(__MODULE__, attributes, meta.caller)
    language = props[:language] || "surface"
    file = get_file(props[:file], props[:module])
    line_range = props[:line_range]
    show_line_numbers = props[:show_line_numbers]
    selected_lines = props[:selected_lines]

    if file do
      Module.put_attribute(meta.caller.module, :external_resource, file)
    end

    {:safe, content} =
      get_content(file, line_range, children)
      |> fix_leading_space()
      |> Phoenix.HTML.html_escape()

    content = content |> IO.iodata_to_binary() |> String.trim()

    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"
    code_class = build_code_class(language, show_line_numbers)
    selected_lines_attrs = build_selected_lines_attrs(selected_lines, meta)

    %Surface.AST.Tag{
      element: "pre",
      directives: [],
      meta: meta,
      attributes:
        [
          %Surface.AST.Attribute{
            meta: meta,
            name: "phx-update",
            type: :string,
            value: %Surface.AST.Literal{value: "ignore"}
          }
        ] ++ selected_lines_attrs,
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
              value: %Surface.AST.Literal{value: code_class}
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
  end

  def selected_lines_to_attr_value(value) do
    value
    |> normalize_selected_lines()
    |> Enum.map_join(",", fn from..to -> "#{from}-#{to}" end)
  end

  defp fix_leading_space(markdown) do
    ["", first | _] = lines = String.split(markdown, "\n")
    [space] = Regex.run(~r/^\s*/, first)

    lines
    |> Enum.map(fn line -> String.replace_prefix(line, space, "") end)
    |> Enum.join("\n")
  end

  defp get_content(nil = _file, _range, [content]) do
    String.replace(content, ~S("\""), ~S("""), global: true)
  end

  defp get_content(file, from..to, _children) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.slice(normalize_line_range(from..to))
    |> List.insert_at(0, "")
    |> Enum.join("\n")
  end

  defp get_content(file, nil, _children) do
    File.read!(file)
  end

  defp get_content(_file, value, _children) do
    raise "invalid line_range. Expected a range, got #{inspect(value)}"
  end

  defp get_file(nil, module) do
    if match?({:module, _mod}, Code.ensure_compiled(module)) do
      module.module_info() |> get_in([:compile, :source]) |> to_string()
    end
  end

  defp get_file(file, _module) do
    file
  end

  defp build_code_class(language, show_line_numbers) do
    classes = ["language-#{language}"]

    classes =
      if show_line_numbers do
        ["line-numbers" | classes]
      else
        classes
      end

    Enum.join(classes, " ")
  end

  defp build_selected_lines_attrs(selected_lines, meta) do
    value = selected_lines_to_attr_value(selected_lines)

    [
      %Surface.AST.Attribute{
        meta: meta,
        name: "data-line",
        type: :string,
        value: %Surface.AST.Literal{value: value}
      }
    ]
  end

  defp normalize_line_range(from..to) do
    index_from =
      if from > 0 do
        from - 1
      else
        raise "invalid line range. Initial line must be greater then 0"
      end

    index_to =
      cond do
        to > 0 ->
          to - 1

        to < 0 ->
          to

        true ->
          raise "invalid line range. Ending line cannot be 0"
      end

    index_from..index_to
  end

  defp normalize_line_range(value) do
    raise "invalid line range. Expected a range, got #{inspect(value)}"
  end

  defp normalize_selected_lines(selected_lines) do
    case selected_lines do
      line when is_integer(line) ->
        [line..(line + 1)]

      from..to ->
        [from..(to + 1)]

      ranges when is_list(ranges) ->
        Enum.flat_map(ranges, &normalize_selected_lines/1)

      _ ->
        []
    end
  end
end
