defmodule SurfaceSiteWeb.UsageWithPhoenixTemplatesTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/usage_with_phoenix_templates")
    assert disconnected_html =~ "Usage with Phoenix templates"
    assert render(page_live) =~ "Usage with Phoenix templates"
  end
end
