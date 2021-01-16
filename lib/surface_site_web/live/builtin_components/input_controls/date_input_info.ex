defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.DateInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{DateInput}

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ DateInput }}>
        <template slot="examples">
          <#Example>
            <DateInput value="2020-06-04" />
          </#Example>
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
