defmodule SurfaceSiteWeb.BlogControllerTest do
  use SurfaceSiteWeb.ConnCase, async: true

  test "GET /blog", %{conn: conn} do
    conn = get(conn, ~p"/blog")
    html = html_response(conn, 200)
    assert html =~ "Continue reading"
    assert html =~ "Tags"
    assert html =~ "Recent posts"
  end

  test "GET /blog/:id", %{conn: conn} do
    conn = get(conn, ~p"/blog/welcome-to-our-blog")
    html = html_response(conn, 200)
    assert html =~ "Welcome to our blog!"
    assert html =~ Plug.HTML.html_escape("We're glad to announce our new Surface blog.")
    assert html =~ "Tags"
    assert html =~ "Recent posts"
  end

  test "GET /blog/tags/:tag", %{conn: conn} do
    conn = get(conn, ~p"/blog/tags/surface")
    html = html_response(conn, 200)
    assert html =~ "Continue reading"
    assert html =~ "Tags"
    assert html =~ "Recent posts"
  end
end
