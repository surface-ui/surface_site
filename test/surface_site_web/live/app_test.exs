defmodule SurfaceSiteWeb.AppTest do
  use SurfaceSiteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")

    assert disconnected_html =~ "Surface UI"

    assert disconnected_html =~
             "A <strong>server-side rendering</strong> component library for <strong>Phoenix</strong>"

    assert disconnected_html =~ "Start building <strong>rich interactive user-interfaces</strong>"
    assert disconnected_html =~ "A set of sample components that you can use"

    assert disconnected_html =~
             "Blog posts sharing relevant content related to <b>Surface</b> and <b>Liveview</b>"

    html = render(page_live)
    assert html =~ "Surface UI"
    assert html =~ "Start building <strong>rich interactive user-interfaces</strong>"
    assert html =~ "A set of sample components that you can use"

    assert html =~
             "Blog posts sharing relevant content related to <b>Surface</b> and <b>Liveview</b>"
  end
end
