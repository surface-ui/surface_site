defmodule SurfaceSiteWeb.BuiltinComponents.LabelInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{TextInput, Label, Field}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={Label}>
        <#template slot="examples">
          <#Example>
            <Field name="name">
              <Label>First name</Label>
              <TextInput/>
            </Field>
          </#Example>
        </#template>
      </ComponentInfo>
    </div>
    """
  end
end
