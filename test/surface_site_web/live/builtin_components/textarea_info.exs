defmodule SurfaceSiteWeb.BuiltinComponents.TextAreaInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/TextArea")
    assert disconnected_html =~ "TextArea"
    assert render(page_live) =~ "TextArea"
  end
end
