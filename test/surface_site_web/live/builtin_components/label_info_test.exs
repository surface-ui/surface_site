defmodule SurfaceSiteWeb.BuiltinComponents.LabelInfoTes do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/Label")
    assert disconnected_html =~ "Label"
    assert render(page_live) =~ "Label"
  end
end
