defmodule SurfaceSiteWeb.BuiltinComponents.LinkInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Link

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ Link }}>
        <template slot="examples">
          <#Example>
            <Link
              label="Go to source"
              to="https://github.com/msaraiva/surface/blob/master/lib/surface/components/link.ex"
              opts={{ data: [confirm: "Are you sure?"] }}
            />
          </#Example>
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
