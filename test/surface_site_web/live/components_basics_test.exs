defmodule SurfaceSiteWeb.ComponentsBasicsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/components_basics")
    assert disconnected_html =~ "Components Basics"
    assert render(page_live) =~ "Components Basics"
  end
end
