defmodule SurfaceSiteWeb.App do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.CardWithIcon
  alias Surface.Components.LiveRedirect
  alias SurfaceSiteWeb.MobileSidebar

  def render(assigns) do
    ~F"""
    <section class="section" style="padding: 3rem 1.5rem">
      <MobileSidebar />
      <div class="container">
        <div class="section" style="padding: 0rem 1.5rem">
          <div class="container">
            <div class="columns">
              <div class="column is-4">
                <CardWithIcon icon="fa-power-off" title="Getting started">
                  <p>
                    Start building <strong>rich interactive user-interfaces</strong>,
                    writing minimal custom Javascript. For a quick start, add Surface
                    to an existing Phoenix LiveView project or install it from scratch.
                  </p>
                  <p><LiveRedirect to="/getting_started">Learn more</LiveRedirect></p>
                </CardWithIcon>
              </div>
              <div class="column is-4">
                <CardWithIcon icon="fa-book" title="Documentation">
                  <p>
                    The basic idea and motivation behind <b>Surface</b>, introducing the
                    all the main features along with <strong>live examples</strong> and detailed explanation to
                    help you to get started.
                  </p>
                  <p><LiveRedirect label="Learn more" to="/documentation" /></p>
                </CardWithIcon>
              </div>
              <div class="column is-4">
                <CardWithIcon icon="fa-code" title="Sample UI Components">
                  <p>
                    A set of sample components you can use as templates to
                    create your own custom components for your projects, including
                    buttons, tabs, table grids and more.
                  </p>
                  <p><LiveRedirect label="Learn more" to="/samplecomponents" /></p>
                </CardWithIcon>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
