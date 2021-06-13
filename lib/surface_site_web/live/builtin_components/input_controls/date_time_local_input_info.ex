defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.DateTimeLocalInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{DateTimeLocalInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={DateTimeLocalInput}>
        <:examples>
          <#Example>
            <DateTimeLocalInput value="2020-06-04T18:45" />
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
