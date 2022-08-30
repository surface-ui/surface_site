defmodule SurfaceSiteWeb.BlogView do
  use SurfaceSiteWeb, :view

  alias Surface.Components.{Link, LiveRedirect}

  def render("index.html", assigns) do
    ~F"""
    <div style="background: #f5f5f5;">
      <div class="container">
        <section class="main-content">
          <div class="container" style="background-color: #fff;">
            <div class="section" style="padding: 1.5rem 2.0rem; padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li class="is-active"><Link to="#" label="Blog" /></li>
                </ul>
              </nav>
              <hr>
              <div class="columns">
                <div class="column" style="padding-bottom: 20px;">
                  {#for post <- @posts}
                    <div class="content">
                      <Link to={Routes.blog_path(@conn, :show, post)}>
                        <h1 style="margin-bottom: 0.1em;">{post.title}</h1>
                      </Link>
                      <p>
                        by {post.author} ・ <time>{Calendar.strftime(post.date, "%B %d, %Y")}</time>
                      </p>
                      <p style="display: flex; align-items: center; gap: 8px; margin-bottom: 1.8em;">
                        <span class="icon">
                          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="#aaa">
                            <path fill-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                          </svg>
                        </span>
                        {#for tag <- post.tags}
                          <Link to={"/blog/tags/#{tag}"}>
                            <span class="tag">{tag}</span>
                          </Link>
                        {/for}
                      </p>
                      {post.description}
                      <Link label="Continue reading »" to={Routes.blog_path(@conn, :show, post)}/>
                      <hr>
                    </div>
                  {#else}
                    <div class="subtitle is-5" style="text-align: center">
                      No post found.
                    </div>
                  {/for}
                </div>
                <div class="blog-right-bar column is-narrow" style="width: 300px;">
                  <.sidebar tags={@tags}, recent_posts={@recent_posts} />
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    """
  end

  def render("show.html", assigns) do
    ~F"""
    <script>
      window.addEventListener('DOMContentLoaded', (event) => {
        Prism.highlightAll()
      });
    </script>
    <div style="background: #f5f5f5;">
      <div class="container">
        <section class="main-content">
          <div class="container" style="background-color: #fff;">
            <div class="section" style="padding: 1.5rem 2.0rem; padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li><LiveRedirect label="Blog" to="/blog" /></li>
                  <li class="is-active"><Link to="#" label={@post.title} /></li>
                </ul>
              </nav>
              <hr>
              <div class="columns">
                <div class="column" style="padding-bottom: 20px;">
                  <div class="content">
                    <h1 style="margin-bottom: 0.1em;">{@post.title}</h1>
                    <p>
                      by {@post.author} ・ <time>{Calendar.strftime(@post.date, "%B %d, %Y")}</time>
                    </p>
                    <p style="display: flex; align-items: center; gap: 8px; margin-bottom: 1.8em;">
                      <span class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="#aaa">
                          <path fill-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                        </svg>
                      </span>
                      {#for tag <- @post.tags}
                        <span class="tag">{tag}</span>
                      {/for}
                    </p>
                    {raw @post.body}
                  </div>
                </div>
                <div class="blog-right-bar column is-narrow" style="width: 300px;">
                  <.sidebar tags={@tags}, recent_posts={@recent_posts} />
                </div>
              </div>
              <nav class="nav-prev-next">
                <LiveRedirect to="/blog">
                  ← Blog
                </LiveRedirect>
              </nav>
            </div>
          </div>
        </section>
      </div>
    </div>
    """
  end

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
              <Link to={Routes.blog_path(SurfaceSiteWeb.Endpoint, :show, post)} class="is-6">
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
