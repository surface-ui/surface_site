defmodule SurfaceSiteWeb.BuiltinComponents.FormInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form
  alias Surface.Components.Form.{TextInput, Label, Field}

  data user, :map, default: %{"name" => "", "email" => ""}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={Form}>
        <:examples>
          <#Example>
            <Form for={:user} change="change" opts={autocomplete: "off"}>
              <Field name="name">
                <Label/>
                <div class="control">
                  <TextInput value={@user["name"]}/>
                </div>
              </Field>
              <Field name="email" class="field">
                <Label>E-mail</Label>
                <div class="control">
                  <TextInput value={@user["email"]}/>
                </div>
              </Field>
            </Form>

            <pre>@user = {Jason.encode!(@user, pretty: true)}</pre>
          </#Example>
        </:examples>
      </ComponentInfo>
    </div>
    """
  end

  def handle_event("change", %{"user" => params}, socket) do
    {:noreply, assign(socket, :user, params)}
  end
end
