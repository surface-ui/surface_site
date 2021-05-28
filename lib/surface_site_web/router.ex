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

    live "/", App
    live "/getting_started", GettingStarted
    live "/usage_with_phoenix_templates", UsageWithPhoenixTemplates
    live "/documentation", Documentation
    live "/components_basics", ComponentsBasics
    live "/properties", Properties
    live "/data", Data
    live "/slots", Slots
    live "/events", Events
    live "/state_management", StateManagement
    live "/contexts", Contexts
    live "/control_flow", ControlFlow
    live "/testing", Testing
    live "/js_interop", JSInterop
    live "/uicomponents/:component", BulmaComponents
    live "/uicomponents", BulmaComponents
    live "/builtincomponents/:component", BuiltinComponents
    live "/builtincomponents", BuiltinComponents
  end
end
