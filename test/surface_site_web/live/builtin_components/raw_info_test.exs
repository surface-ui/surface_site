defmodule SurfaceSiteWeb.BuiltinComponents.RawInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Raw")
    assert disconnected_html =~ "Raw"
    assert render(page_live) =~ "Raw"
  end
end
