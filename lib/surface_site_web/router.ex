defmodule SurfaceSiteWeb.Router do
  use SurfaceSiteWeb, :router
  import Surface.Catalogue.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SurfaceSiteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", SurfaceSiteWeb do
    pipe_through :browser

    get "/blog", BlogController, :index
    get "/blog/tags/:tag", BlogController, :index
    get "/blog/:id", BlogController, :show

    live "/", App
    live "/getting_started", GettingStarted
    live "/usage_with_phoenix_templates", UsageWithPhoenixTemplates
    live "/manual_setup", ManualSetup
    live "/layouts_and_dead_views", LayoutsAndDeadViews
    live "/documentation", Documentation
    live "/components_basics", ComponentsBasics
    live "/properties", Properties
    live "/data", Data
    live "/slots", Slots
    live "/events", Events
    live "/state_management", StateManagement
    live "/contexts", Contexts
    live "/template_syntax", TemplateSyntax
    live "/testing", Testing
    live "/js_interop", JSInterop
    live "/scoped_css", ScopedCSS
    live "/samplecomponents/:component", SampleComponents
    live "/samplecomponents", SampleComponents
    live "/builtincomponents/:component", BuiltinComponents
    live "/builtincomponents", BuiltinComponents
  end

  if Mix.env() == :dev do
    scope "/" do
      pipe_through :browser

      surface_catalogue("/catalogue")
    end
  end
end
