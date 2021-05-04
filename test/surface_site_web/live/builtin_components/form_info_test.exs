defmodule SurfaceSiteWeb.BuiltinComponents.FormInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Form")
    assert disconnected_html =~ "Form"
    assert render(page_live) =~ "Form"
  end
end
