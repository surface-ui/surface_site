defmodule SurfaceSiteWeb.StateManagementTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/state_management")
    assert disconnected_html =~ "State management"
    assert render(page_live) =~ "State management"
  end
end
