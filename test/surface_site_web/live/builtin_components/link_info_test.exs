defmodule SurfaceSiteWeb.BuiltinComponents.LinkInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Link")
    assert disconnected_html =~ "Link"
    assert render(page_live) =~ "Link"
  end
end
