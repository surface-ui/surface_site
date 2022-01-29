defmodule SurfaceSiteWeb.UsageWithoutLiveviewTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/usage_without_liveview")
    assert disconnected_html =~ "Usage without LiveView"
    assert render(page_live) =~ "Usage without LiveView"
  end
end
