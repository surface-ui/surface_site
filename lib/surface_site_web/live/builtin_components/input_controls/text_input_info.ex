defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.TextInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.TextInput

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={TextInput}>
        <:examples>
          <#Example>
            <TextInput value="A single-line text" />
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
