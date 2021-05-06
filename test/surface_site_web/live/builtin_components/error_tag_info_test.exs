defmodule SurfaceSiteWeb.BuiltinComponents.ErrorTagInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/ErrorTag")
    assert disconnected_html =~ "ErrorTag"
    assert render(page_live) =~ "ErrorTag"
  end
end
