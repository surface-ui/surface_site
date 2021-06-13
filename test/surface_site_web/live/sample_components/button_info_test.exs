defmodule SurfaceSiteWeb.SampleComponents.ButtonInfoTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/samplecomponents/Button")
    assert disconnected_html =~ "Button"
    assert render(page_live) =~ "Button"
  end
end
