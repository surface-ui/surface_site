defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.DateInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{DateInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={DateInput}>
        <:examples>
          <#Example>
            <DateInput value="2020-06-04" />
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
