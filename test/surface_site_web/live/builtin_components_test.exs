defmodule SurfaceSiteWeb.BuiltinComponentsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents")
    assert disconnected_html =~ "Built-in Components"
    assert render(page_live) =~ "Built-in Components"
  end
end
