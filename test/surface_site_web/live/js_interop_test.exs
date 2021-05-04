defmodule SurfaceSiteWeb.JSInteropTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/js_interop")
    assert disconnected_html =~ "JS Interoperability"
    assert render(page_live) =~ "JS Interoperability"
  end
end
