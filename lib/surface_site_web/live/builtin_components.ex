defmodule SurfaceSiteWeb.BuiltinComponents do
  use Surface.LiveView

  alias SurfaceSiteWeb.Sidebar
  alias Surface.Components.{LiveRedirect, Link}
  alias SurfaceSiteWeb.MobileSidebar
  alias SurfaceSiteWeb.Components.ComponentInfo

  data component, :string

  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, :component, params["component"])}
  end

  def render(assigns) do
    ~H"""
    <div style="position: relative;">
      <MobileSidebar />
      <div class="sidebar-bg" />
      <div class="container is-fullhd">
        <section class="main-content columns">
          <Sidebar />
          <div class="container column" style="background-color: #fff;">
            <div class="section" style="padding-bottom: 0px;">
              <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li :if={{ @component == nil }} class="is-active">
                    <Link to="#" label="Built-in Components" />
                  </li>
                  <li :if={{ @component != nil }}>
                    <LiveRedirect label="Built-in Components" to="/builtincomponents" />
                  </li>
                  <li :if={{ input_control?(@component) }}>
                    <LiveRedirect label="Input Controls" to="/builtincomponents/InputControls" />
                  </li>
                  <li :if={{ @component != nil }} class="is-active">
                    <Link to="#" label={{ component_label(@component) }} />
                  </li>
                </ul>
              </nav>
            </div>
            <div class="section">
              {{ route(assigns) }}
            </div>
            <nav :if={{ input_control?(@component) }} class="nav-prev-next">
              <LiveRedirect to="/builtincomponents/InputControls">
                ← Input Controls
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end

  defp input_control?(component) do
    component in [
      "ColorInput",
      "DateInput",
      "DateTimeLocalInput",
      "EmailInput",
      "HiddenInput",
      "NumberInput",
      "PasswordInput",
      "RangeInput",
      "SearchInput",
      "TelephoneInput",
      "TextInput",
      "TimeInput",
      "UrlInput",
      "CheckBox",
      "Select",
      "Inputs",
      "FileInput",
      "HiddenInputs",
      "MultipleSelect",
      "OptionsForSelect",
      "DateTimeSelect",
      "TimeSelect"
    ]
  end

  defp component_label("InputControls") do
    "Input Controls"
  end

  defp component_label(component) do
    component
  end

  defp route(%{component: nil} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.Index id="index" />
    """
  end

  defp route(%{component: "InputControls"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls id="InputControlsInfo" />
    """
  end

  defp route(%{component: "ColorInput"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.ColorInputInfo id="ColorInputInfo" />
    """
  end

  defp route(%{component: "DateInput"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.DateInputInfo id="DateInputInfo" />
    """
  end

  defp route(%{component: "DateTimeLocalInput"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.DateTimeLocalInputInfo id="DateTimeLocalInputInfo" />
    """
  end

  defp route(%{component: "EmailInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.EmailInput }} />
    """
  end

  defp route(%{component: "HiddenInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.HiddenInput }} />
    """
  end

  defp route(%{component: "NumberInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.NumberInput }} />
    """
  end

  defp route(%{component: "PasswordInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.PasswordInput }} />
    """
  end

  defp route(%{component: "RangeInput"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.RangeInputInfo id="RangeInputInfo" />
    """
  end

  defp route(%{component: "SearchInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.SearchInput }} />
    """
  end

  defp route(%{component: "TelephoneInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.TelephoneInput }} />
    """
  end

  defp route(%{component: "TextInput"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.TextInputInfo id="TextInputInfo" />
    """
  end

  defp route(%{component: "RadioButton"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.RadioButtonInfo id="RadioButtonInfo" />
    """
  end

  defp route(%{component: "TimeInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.TimeInput }} />
    """
  end

  defp route(%{component: "UrlInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.UrlInput }} />
    """
  end

  defp route(%{component: "Checkbox"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.Checkbox }} />
    """
  end

  defp route(%{component: "Select"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.SelectInfo id="SelectInfo" />
    """
  end

  defp route(%{component: "Inputs"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.Inputs }} />
    """
  end

  defp route(%{component: "FileInput"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.FileInput }} />
    """
  end

  defp route(%{component: "HiddenInputs"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.HiddenInputs }} />
    """
  end

  defp route(%{component: "MultipleSelect"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.MultipleSelect }} />
    """
  end

  defp route(%{component: "OptionsForSelect"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.OptionsForSelect }} />
    """
  end

  defp route(%{component: "TimeSelect"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.TimeSelect }} />
    """
  end

  defp route(%{component: "DateTimeSelect"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.DateTimeSelect }} />
    """
  end

  defp route(%{component: "Link"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.LinkInfo id="LinkInfo" />
    """
  end

  defp route(%{component: "LiveRedirect"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.LiveRedirectInfo id="LiveRedirectInfo" />
    """
  end

  defp route(%{component: "LivePatch"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.LivePatchInfo id="LivePatchInfo" />
    """
  end

  defp route(%{component: "Form"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.FormInfo id="FormInfo" />
    """
  end

  defp route(%{component: "Field"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.FieldInfo id="FieldInfo" />
    """
  end

  defp route(%{component: "FieldContext"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.FieldContext }} />
    """
  end

  defp route(%{component: "Label"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.LabelInfo id="LabelInfo" />
    """
  end

  defp route(%{component: "TextArea"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.TextAreaInfo id="TextAreaInfo" />
    """
  end

  defp route(%{component: "ErrorTag"} = assigns) do
    ~H"""
    <ComponentInfo module={{ Surface.Components.Form.ErrorTag }} />
    """
  end

  defp route(%{component: "Markdown"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.MarkdownInfo id="MarkdownInfo" />
    """
  end

  defp route(%{component: "Raw"} = assigns) do
    ~H"""
    <SurfaceSiteWeb.BuiltinComponents.RawInfo id="RawInfo" />
    """
  end

  defp route(assigns) do
    ~H"""
    No documentation for component <strong>{{ @component }}</strong> defined.
    """
  end
end
