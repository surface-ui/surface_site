defmodule SurfaceSiteWeb.BuiltinComponents.InputControlsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/InputControls")
    assert disconnected_html =~ "InputControls"
    assert render(page_live) =~ "InputControls"
  end
end
