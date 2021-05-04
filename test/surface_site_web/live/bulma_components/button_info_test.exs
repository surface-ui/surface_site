defmodule SurfaceSiteWeb.BulmaComponents.ButtonInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/uicomponents/Button")
    assert disconnected_html =~ "Button"
    assert render(page_live) =~ "Button"
  end
end
