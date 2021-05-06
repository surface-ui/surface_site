defmodule SurfaceSiteWeb.GettingStartedTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/getting_started")
    assert disconnected_html =~ "Getting Started"
    assert render(page_live) =~ "Getting Started"
  end
end
