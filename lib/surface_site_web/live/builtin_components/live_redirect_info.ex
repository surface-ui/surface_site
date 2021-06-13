defmodule SurfaceSiteWeb.BuiltinComponents.LiveRedirectInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo, SectionSeparator}
  alias Surface.Components.LiveRedirect

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={LiveRedirect}>
        <:examples>
          <#Example>
            <LiveRedirect to="#">
              <i class="fa fa-link is-info"/>
              My link
            </LiveRedirect>
          </#Example>
          <SectionSeparator title="Label" id="label" />
          <#Example>
            <LiveRedirect label="My link" to="#"/>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
