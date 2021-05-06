defmodule SurfaceSiteWeb.SlotsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/slots")
    assert disconnected_html =~ "Slots"
    assert render(page_live) =~ "Slots"
  end
end
