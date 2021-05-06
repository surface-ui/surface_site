defmodule SurfaceSiteWeb.AppTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Surface UI"
    assert render(page_live) =~ "Surface UI"
  end
end
