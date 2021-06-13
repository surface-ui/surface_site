defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.RangeInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{RangeInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={RangeInput}>
        <:examples>
          <#Example>
            <RangeInput min="1" max="100"/>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
