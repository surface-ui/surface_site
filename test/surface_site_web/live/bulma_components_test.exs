defmodule SurfaceSiteWeb.BulmaComponentsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/uicomponents")
    assert disconnected_html =~ "UI Components"
    assert render(page_live) =~ "UI Components"
  end
end
