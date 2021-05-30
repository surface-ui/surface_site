defmodule SurfaceSiteWeb.TemplateSyntaxTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/template_syntax")
    assert disconnected_html =~ "Template Syntax"
    assert render(page_live) =~ "Template Syntax"
  end
end
