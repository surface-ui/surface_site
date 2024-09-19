defmodule SurfaceSiteWeb.BlogHTML do
  use SurfaceSiteWeb, :html

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
            <.link navigate={"/blog/tags/#{tag}"}>
              <span class="tag">{tag}</span>
            </.link>
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
              <.link navigate={~p"/blog/#{post.id}"} class="is-6">
                {post.title}
              </.link>
              <p class="subtitle is-7 has-text-grey">
                <time>{Calendar.strftime(post.date, "%B %d, %Y")}</time> ・ {post.author}
              </p>
            </div>
          {/for}
          <.link navigate="/blog">
            See all +
          </.link>
        </div>
      </div>
    </nav>
    """
  end
end
