defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.RangeInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{RangeInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={RangeInput}>
        <#template slot="examples">
          <#Example>
            <RangeInput min="1" max="100"/>
          </#Example>
        </#template>
      </ComponentInfo>
    </div>
    """
  end
end
