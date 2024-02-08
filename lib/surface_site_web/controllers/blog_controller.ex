defmodule SurfaceSiteWeb.BlogController do
  use SurfaceSiteWeb, :controller

  alias SurfaceSite.Blog

  def index(conn, %{"tag" => tag}) do
    render(conn, :index,
      layout: false,
      posts: Blog.get_posts_by_tag!(tag),
      recent_posts: Blog.recent_posts(5),
      tags: Blog.all_tags()
    )
  end

  def index(conn, _params) do
    render(conn, :index,
      layout: false,
      posts: Blog.visible_posts(),
      recent_posts: Blog.recent_posts(5),
      tags: Blog.all_tags()
    )
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html",
      layout: false,
      post: Blog.get_post_by_id!(id),
      recent_posts: Blog.recent_posts(5),
      tags: Blog.all_tags()
    )
  end
end
