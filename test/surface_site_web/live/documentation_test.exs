defmodule SurfaceSiteWeb.DocumentationTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/documentation")
    assert disconnected_html =~ "Documentation"
    assert render(page_live) =~ "Documentation"
  end
end
