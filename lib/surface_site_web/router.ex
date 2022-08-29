defmodule SurfaceSiteWeb.Router do
  use SurfaceSiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {SurfaceSiteWeb.LayoutView, :root}
  end

  scope "/", SurfaceSiteWeb do
    pipe_through :browser

    get "/blog", BlogController, :index
    get "/blog/tags/:tag", BlogController, :index
    get "/blog/:id", BlogController, :show

    live "/", App
    live "/getting_started", GettingStarted
    live "/usage_with_phoenix_templates", UsageWithPhoenixTemplates
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
    live "/samplecomponents/:component", SampleComponents
    live "/samplecomponents", SampleComponents
    live "/builtincomponents/:component", BuiltinComponents
    live "/builtincomponents", BuiltinComponents
  end
end
