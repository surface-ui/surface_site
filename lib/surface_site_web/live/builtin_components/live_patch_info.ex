defmodule SurfaceSiteWeb.BuiltinComponents.LivePatchInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo, SectionSeparator}
  alias Surface.Components.LivePatch

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ LivePatch }}>
        <template slot="examples">
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
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
