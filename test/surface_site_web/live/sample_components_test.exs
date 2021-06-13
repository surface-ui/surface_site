defmodule SurfaceSiteWeb.SampleComponentsTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/samplecomponents")
    assert disconnected_html =~ "Sample UI Components"
    assert render(page_live) =~ "Sample UI Components"
  end
end
