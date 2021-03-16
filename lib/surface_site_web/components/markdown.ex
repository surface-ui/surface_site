defmodule SurfaceSiteWeb.Components.Markdown do
  @moduledoc false

  def add_heading_link({"h2", attrs, children, meta}) do
    id = children |> get_text() |> format_id()
    attrs = [{"id", id}, {"class", "section-heading"}, {"phx-hook", "SectionHeading"} | attrs]
    {"h2", attrs, nil, meta}
  end

  def add_heading_link(node) do
    node
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
