defmodule SurfaceSiteWeb.EventsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/events")
    assert disconnected_html =~ "Events"
    assert render(page_live) =~ "Events"
  end
end
