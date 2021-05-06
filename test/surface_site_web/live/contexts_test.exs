defmodule SurfaceSiteWeb.ContextsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/contexts")
    assert disconnected_html =~ "Contexts"
    assert render(page_live) =~ "Contexts"
  end
end
