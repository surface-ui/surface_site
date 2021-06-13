defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.RadioButtonInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{RadioButton, Field}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={RadioButton}>
        <:examples>
          <#Example>
            <Field name="answer">
              <div class="control">
                <label class="radio">
                  <RadioButton value="yes" checked /> Yes
                </label>
                <label class="radio">
                  <RadioButton value="no" /> No
                </label>
              </div>
            </Field>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
