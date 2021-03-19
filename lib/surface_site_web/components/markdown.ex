defmodule SurfaceSiteWeb.Components.Markdown do
  alias SurfaceSiteWeb.Components.Code

  @moduledoc false

  # Add link for `## Heading`
  def post_processor({"h2", attrs, children, meta}) do
    id = children |> get_text() |> format_id()
    attrs = [{"id", id}, {"class", "section-heading"}, {"phx-hook", "SectionHeading"} | attrs]
    {"h2", attrs, nil, meta}
  end

  # Update <code> for code highlighting
  def post_processor({"code", attrs, _children, meta}) do
    attrs =
      case attrs do
        [{"class", "inline"}] ->
          attrs

        _ ->
          attrs = if attrs == [], do: [{"class", "language-text"}], else: attrs
          id = "Markdown_code_#{:erlang.unique_integer([:positive])}"
          [{"id", id}, {"phx-hook", "Highlight"} | attrs]
      end

    {"code", attrs, nil, meta}
  end

  # Update <pre> for code highlighting
  def post_processor({"pre", attrs, _children, meta}) do
    {show_line_numbers, attrs} =
      Enum.split_with(attrs, fn {k, _v} -> k == "show_line_numbers" end)

    {selected_lines, attrs} = Enum.split_with(attrs, fn {k, _v} -> k == "selected_lines" end)

    attrs =
      case show_line_numbers do
        [{"show_line_numbers", "true"}] ->
          [{"class", "line-numbers"} | attrs]

        _ ->
          attrs
      end

    attrs =
      case selected_lines do
        [{"selected_lines", value}] ->
          [{"data-line", translate_selected_lines(value)} | attrs]

        _ ->
          attrs
      end

    attrs = [{"phx-update", "ignore"} | attrs]
    {"pre", attrs, nil, meta}
  end

  def post_processor(node) do
    node
  end

  defp translate_selected_lines(value) do
    selected_lines =
      for item <- String.split(value, ",") do
        case item |> String.trim() |> String.split("-") do
          [v] -> String.to_integer(v)
          [v1, v2] -> String.to_integer(v1)..String.to_integer(v2)
        end
      end

    Code.selected_lines_to_attr_value(selected_lines)
  end

  defp get_text([]) do
    ""
  end

  defp get_text([node | nodes]) when is_binary(node) do
    node <> get_text(nodes)
  end

  defp get_text([{_, _, children, _} | nodes]) do
    get_text(children) <> get_text(nodes)
  end

  defp format_id(value) do
    value
    |> String.trim()
    |> String.replace(" ", "-")
    |> String.downcase()
  end

  def to_html(text, opts \\ [])

  def to_html(nil, _opts) do
    ""
  end

  def to_html(text, opts) do
    strip = Keyword.get(opts, :strip, false)
    class = Keyword.get(opts, :class, "content")

    markdown =
      text
      |> HtmlEntities.decode()
      |> String.trim_leading()

    html =
      case Earmark.as_html(markdown, smartypants: false) do
        {:ok, html, messages} ->
          Enum.each(messages, fn msg -> IO.warn(msg) end)
          html

        {:error, html, messages} ->
          Enum.each(messages, fn
            {:warning, _line, msg} ->
              message = """
              #{msg}

              Original code:

              #{text}
              """

              IO.warn(message)

            msg ->
              IO.warn(msg)
          end)

          html
      end

    if strip do
      html = html |> String.trim_leading("<p>") |> String.trim_trailing("</p>")
      {:safe, html}
    else
      {:safe, ~s(<div class="#{class}">#{html}</div>)}
    end
  end
end
