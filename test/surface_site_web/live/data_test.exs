defmodule SurfaceSiteWeb.DataTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/data")
    assert disconnected_html =~ "Data"
    assert render(page_live) =~ "Data"
  end
end
