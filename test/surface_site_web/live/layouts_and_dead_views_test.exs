defmodule SurfaceSiteWeb.LayoutsAndDeadViewsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/layouts_and_dead_views")
    assert disconnected_html =~ "Layouts &amp; dead views"
    assert render(page_live) =~ "Layouts &amp; dead views"
  end
end
