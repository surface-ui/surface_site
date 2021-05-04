defmodule SurfaceSiteWeb.BuiltinComponents.SelectInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Select")
    assert disconnected_html =~ "Select"
    assert render(page_live) =~ "Select"
  end
end
