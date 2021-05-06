defmodule SurfaceSiteWeb.BuiltinComponents.FieldContextInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/FieldContext")
    assert disconnected_html =~ "FieldContext"
    assert render(page_live) =~ "FieldContext"
  end
end
