defmodule SurfaceSiteWeb.BuiltinComponents.LinkInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Link

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={Link}>
        <:examples>
          <#Example>
            <Link
              label="Go to source"
              to="https://github.com/surface-ui/surface/blob/master/lib/surface/components/link.ex"
              opts={data: [confirm: "Are you sure?"]}
            />
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
