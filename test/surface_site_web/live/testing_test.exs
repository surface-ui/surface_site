defmodule SurfaceSiteWeb.TestingTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/testing")
    assert disconnected_html =~ "Testing"
    assert render(page_live) =~ "Testing"
  end
end
