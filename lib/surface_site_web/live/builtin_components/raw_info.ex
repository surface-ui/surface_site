defmodule SurfaceSiteWeb.BuiltinComponents.RawInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{ComponentInfo, Example}
  alias Surface.Components.Raw

  def render(assigns) do
    assigns = Map.put(assigns, :user, "John Doe")

    ~H"""
    <div>
      <ComponentInfo module={{ Raw }}>
        <template slot="examples">
          <#Example language="html">
            With traslation:
            <div class="section title">
              {{ @user }}
            </div>

            Without traslation:
            <#Raw>
              <div class="section title">
                {{ @user }}
              </div>
            </#Raw>
          </#Example>
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
