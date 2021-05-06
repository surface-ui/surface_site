defmodule SurfaceSiteWeb.PropertiesTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/properties")
    assert disconnected_html =~ "Properties"
    assert render(page_live) =~ "Properties"
  end
end
