defmodule SurfaceSiteWeb.BuiltinComponents.MarkdownInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Markdown")
    assert disconnected_html =~ "Markdown"
    assert render(page_live) =~ "Markdown"
  end
end
