defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.RadioButtonInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{RadioButton, Field}

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ RadioButton }}>
        <template slot="examples">
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
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
