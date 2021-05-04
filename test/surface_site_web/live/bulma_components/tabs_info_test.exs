defmodule SurfaceSiteWeb.BulmaComponents.TabsInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/uicomponents/Tabs")
    assert disconnected_html =~ "Tabs"
    assert render(page_live) =~ "Tabs"
  end
end
