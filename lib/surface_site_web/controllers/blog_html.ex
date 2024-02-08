defmodule SurfaceSiteWeb.BlogHTML do
  use SurfaceSiteWeb, :html

  alias Surface.Components.{Link, LiveRedirect}

  embed_sface("blog_html/index.sface")
  embed_sface("blog_html/show.sface")

  def sidebar(assigns) do
    ~F"""
    {!--
    <nav class="panel">
      <p class="panel-heading has-text-grey-dark">
        Search
      </p>
      <div class="panel-block">
        <p class="control has-icons-left">
          <input class="input" type="text" placeholder="Search with DuckDuckGo..." style="border-radius: 6px;">
          <span class="icon is-left">
            <i class="fas fa-search" aria-hidden="true"></i>
          </span>
        </p>
      </div>
    </nav>--}
    <nav class="panel">
      <p class="panel-heading has-text-grey-dark">
        Tags
      </p>
      <div class="panel-block">
        <div style="display: flex; gap: 8px; flex-wrap: wrap;">
          {#for tag <- @tags}
            <Link to={"/blog/tags/#{tag}"}>
              <span class="tag">{tag}</span>
            </Link>
          {/for}
        </div>
      </div>
    </nav>
    <nav class="panel">
      <p class="panel-heading has-text-grey-dark">
        Recent posts
      </p>
      <div class="panel-block">
        <div style="display: flex; flex-direction: column; gap: 1rem;">
          {#for post <- @recent_posts}
            <div>
              <Link to={~p"/blog/#{post.id}"} class="is-6">
                {post.title}
              </Link>
              <p class="subtitle is-7 has-text-grey">
                <time>{Calendar.strftime(post.date, "%B %d, %Y")}</time> ・ {post.author}
              </p>
            </div>
          {/for}
          <Link to="/blog">
            See all +
          </Link>
        </div>
      </div>
    </nav>
    """
  end
end
