defmodule SurfaceSiteWeb.BuiltinComponents.LivePatchInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo, SectionSeparator}
  alias Surface.Components.LivePatch

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={LivePatch}>
        <:examples>
          <#Example>
            <LivePatch to="#">
              <i class="fa fa-link is-info"/>
              My link
            </LivePatch>
          </#Example>
          <SectionSeparator id="label" title="Label" />
          <#Example>
            <LivePatch label="My link" to="#"/>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
