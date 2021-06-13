defmodule SurfaceSiteWeb.BuiltinComponents.InputControls.DateTimeLocalInputInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{DateTimeLocalInput}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={DateTimeLocalInput}>
        <#template slot="examples">
          <#Example>
            <DateTimeLocalInput value="2020-06-04T18:45" />
          </#Example>
        </#template>
      </ComponentInfo>
    </div>
    """
  end
end
