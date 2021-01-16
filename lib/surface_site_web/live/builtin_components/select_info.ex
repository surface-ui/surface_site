defmodule SurfaceSiteWeb.BuiltinComponents.SelectInfo do
  use Surface.LiveView

  alias SurfaceSiteWeb.Components.{Example, ComponentInfo}
  alias Surface.Components.Markdown
  alias Surface.Components.Form.Select

  def render(assigns) do
    ~H"""
    <div>
      <ComponentInfo module={{ Select }}>
        <template slot="examples">
          <#Example language="html" direction="vertical">
            <div class="select">
              <Select form="user" field="role" options={{ "Admin": "admin", "User": "user" }} />
            </div>
          </#Example>
          <#Markdown>
            ### Other Select related components

              * [MultipleSelect](/builtincomponents/MultipleSelect){: data-phx-link="redirect" data-phx-link-state="push"} -
                Provides a wrapper for Phoenix.HTML.Form's `multiple_select/4` function.

              * [OptionsForSelect](/builtincomponents/OptionsForSelect){: data-phx-link="redirect" data-phx-link-state="push"} -
                Defines options to be used inside a select.

              * [DateTimeSelect](/builtincomponents/DateTimeSelect){: data-phx-link="redirect" data-phx-link-state="push"} -
                Provides a wrapper for Phoenix.HTML.Form's `datetime_select/3` function.

              * [TimeSelect](/builtincomponents/TimeSelect){: data-phx-link="redirect" data-phx-link-state="push"} -
                Provides a wrapper for Phoenix.HTML.Form's `time_select/3` function.
          </#Markdown>
          <hr>
        </template>
      </ComponentInfo>
    </div>
    """
  end
end
