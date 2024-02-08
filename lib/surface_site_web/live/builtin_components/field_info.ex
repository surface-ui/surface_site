defmodule SurfaceSiteWeb.BuiltinComponents.FieldInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form
  alias Surface.Components.Form.{TextInput, Label, Field}

  data user, :map, default: %{"name" => "John Doe", "email" => ""}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={Field}>
        <:examples>
          <#Example>
            <Form for={%{}} as={:user}>
              <Field name={:email}>
                <Label>E-mail</Label>
                <div class="control">
                  <TextInput value={@user["email"]}/>
                </div>
              </Field>
            </Form>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end
end
