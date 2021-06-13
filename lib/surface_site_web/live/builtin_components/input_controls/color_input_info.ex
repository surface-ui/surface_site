defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.ColorInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{Field, Label, ColorInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={ColorInput}>
        <:examples>
          <#Example>
            <Field name="color">
              <Label>Choose a color:</Label>
              <ColorInput value="#3298dc"/>
            </Field>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
