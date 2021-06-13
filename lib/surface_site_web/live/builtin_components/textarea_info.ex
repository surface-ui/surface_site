defmodule SurfaceSiteWeb.BuiltinComponents.TextAreaInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Form.{TextArea}

  def render(assigns) do
    ~F"""
    <div>
      <ComponentInfo module={TextArea}>
        <#template slot="examples">
          <#Example>
            <TextArea
              rows="4"
              opts={placeholder: "4 lines of textarea"}
            />
          </#Example>
        </#template>
      </ComponentInfo>
    </div>
    """
  end
end
