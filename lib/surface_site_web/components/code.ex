defmodule SurfaceSiteWeb.Components.Code do
  use Surface.MacroComponent

  alias Surface.MacroComponent

  prop language, :string, static: true
  prop file, :string, static: true
  prop module, :module, static: true
  prop line_range, :range, static: true
  prop show_line_numbers, :boolean, static: true
  prop selected_lines, :string, static: true

  @impl true
  def expand(attributes, content, meta) do
    props = MacroComponent.eval_static_props!(__MODULE__, attributes, meta.caller)
    language = props[:language] || "surface"
    file = get_file(props[:file], props[:module])
    line_range = props[:line_range]
    show_line_numbers = props[:show_line_numbers]
    selected_lines = props[:selected_lines]

    if file do
      Module.put_attribute(meta.caller.module, :external_resource, file)
    end

    id = "#{inspect(__MODULE__)}_#{:erlang.unique_integer([:positive])}"
    code = get_code(file, line_range, content)

    build_ast(code, meta,
      id: id,
      language: language,
      show_line_numbers: show_line_numbers,
      selected_lines: selected_lines
    )
  end

  def build_ast(code, meta, opts) do
    id = opts[:id]
    language = opts[:language]
    show_line_numbers = opts[:show_line_numbers]
    selected_lines = opts[:selected_lines] || ""

    class = build_class(language, show_line_numbers)

    code_content =
      code
      |> fix_leading_space()
      |> Phoenix.HTML.html_escape()
      |> elem(1)
      |> IO.iodata_to_binary()
      |> String.trim()

    container_id = "#{inspect(__MODULE__)}_container_#{:erlang.unique_integer([:positive])}"

    quote_surface do
      ~F"""
      <pre id={^container_id} class={^class} data-line={^selected_lines} phx-update="ignore"><code id={^id} class={^class} phx-hook="Highlight">{^code_content}</code></pre>
      """
    end
  end

  defp fix_leading_space(markdown) do
    lines = String.split(markdown, "\n")

    first =
      case lines do
        ["", first | _] -> first
        [first | _] -> first
      end

    [space] = Regex.run(~r/^\s*/, first)

    lines
    |> Enum.map(fn line -> String.replace_prefix(line, space, "") end)
    |> Enum.join("\n")
  end

  defp get_code(nil = _file, _range, content) do
    String.replace(content, ~S("\""), ~S("""), global: true)
  end

  defp get_code(file, from..to, _content) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.slice(normalize_line_range(from..to))
    |> Enum.join("\n")
  end

  defp get_code(file, nil, _children) do
    File.read!(file)
  end

  defp get_code(_file, value, _children) do
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

  defp build_class(language, show_line_numbers) do
    classes = ["language-#{language}"]

    classes =
      if show_line_numbers do
        ["line-numbers" | classes]
      else
        classes
      end

    Enum.join(classes, " ")
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
end
