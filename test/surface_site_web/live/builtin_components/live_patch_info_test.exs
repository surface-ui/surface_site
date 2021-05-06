defmodule SurfaceSiteWeb.BuiltinComponents.LivePatchInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/LivePatch")
    assert disconnected_html =~ "LivePatch"
    assert render(page_live) =~ "LivePatch"
  end
end
