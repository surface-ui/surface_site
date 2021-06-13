defmodule SurfaceSiteWeb.BuiltinComponents.RawInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{ComponentInfo, Example}
  alias Surface.Components.Raw

  def render(assigns) do
    assigns = Map.put(assigns, :user, "John Doe")

    ~F"""
    <div>
      <ComponentInfo module={Raw}>
        <#template slot="examples">
          <#Example language="html">
            With translation:
            <div class="section title">
              {@user}
            </div>

            Without translation:
            <#Raw>
              <div class="section title">
                {@user}
              </div>
            </#Raw>
          </#Example>
        </#template>
      </ComponentInfo>
    </div>
    """
  end
end
