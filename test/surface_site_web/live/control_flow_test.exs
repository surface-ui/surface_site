defmodule SurfaceSiteWeb.ControlFlowTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/control_flow")
    assert disconnected_html =~ "Control Flow"
    assert render(page_live) =~ "Control Flow"
  end
end
