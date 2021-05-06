defmodule SurfaceSiteWeb.BuiltinComponents.FieldInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Field")
    assert disconnected_html =~ "Field"
    assert render(page_live) =~ "Field"
  end
end
