defmodule SurfaceSiteWeb.BuiltinComponents.LiveRedirectInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo, SectionSeparator}
  alias Surface.Components.LiveRedirect

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ LiveRedirect }}>
        <template slot="examples">
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
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
