defmodule SurfaceSiteWeb.BuiltinComponents.LiveRedirectInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/builtincomponents/LiveRedirect")
    assert disconnected_html =~ "LiveRedirect"
    assert render(page_live) =~ "LiveRedirect"
  end
end
