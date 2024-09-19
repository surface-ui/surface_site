defmodule SurfaceSiteWeb.BuiltinComponents do
  use Surface.LiveView

  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.Components.MobileSidebar
  alias SurfaceSiteWeb.Components.ComponentInfo

  data component, :string

  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, :component, params["component"])}
  end

  def render(assigns) do
    ~F"""
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
                  <li><.link navigate="/">Home</.link></li>
                  <li :if={@component == nil} class="is-active">
                    <a href="#">Built-in Components</a>
                  </li>
                  <li :if={@component != nil}>
                    <.link navigate="/builtincomponents">Built-in Components</.link>
                  </li>
                  <li :if={input_control?(@component)}>
                    <.link navigate="/builtincomponents/InputControls">Input Controls</.link>
                  </li>
                  <li :if={@component != nil} class="is-active">
                    <a href="#">{component_label(@component)}</a>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="section">
              {route(assigns)}
            </div>
            <nav :if={input_control?(@component)} class="nav-prev-next">
              <.link navigate="/builtincomponents/InputControls">
                ← Input Controls
              </.link>
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
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.Index id="index" />
    """
  end

  defp route(%{component: "InputControls"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls id="InputControlsInfo" />
    """
  end

  defp route(%{component: "ColorInput"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.ColorInputInfo id="ColorInputInfo" />
    """
  end

  defp route(%{component: "DateInput"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.DateInputInfo id="DateInputInfo" />
    """
  end

  defp route(%{component: "DateTimeLocalInput"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.DateTimeLocalInputInfo id="DateTimeLocalInputInfo" />
    """
  end

  defp route(%{component: "EmailInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.EmailInput} />
    """
  end

  defp route(%{component: "HiddenInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.HiddenInput} />
    """
  end

  defp route(%{component: "NumberInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.NumberInput} />
    """
  end

  defp route(%{component: "PasswordInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.PasswordInput} />
    """
  end

  defp route(%{component: "RangeInput"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.RangeInputInfo id="RangeInputInfo" />
    """
  end

  defp route(%{component: "SearchInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.SearchInput} />
    """
  end

  defp route(%{component: "TelephoneInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.TelephoneInput} />
    """
  end

  defp route(%{component: "TextInput"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.TextInputInfo id="TextInputInfo" />
    """
  end

  defp route(%{component: "RadioButton"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.InputControls.RadioButtonInfo id="RadioButtonInfo" />
    """
  end

  defp route(%{component: "TimeInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.TimeInput} />
    """
  end

  defp route(%{component: "UrlInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.UrlInput} />
    """
  end

  defp route(%{component: "Checkbox"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.Checkbox} />
    """
  end

  defp route(%{component: "Select"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.SelectInfo id="SelectInfo" />
    """
  end

  defp route(%{component: "Inputs"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.Inputs} />
    """
  end

  defp route(%{component: "FileInput"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.FileInput} />
    """
  end

  defp route(%{component: "HiddenInputs"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.HiddenInputs} />
    """
  end

  defp route(%{component: "MultipleSelect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.MultipleSelect} />
    """
  end

  defp route(%{component: "OptionsForSelect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.OptionsForSelect} />
    """
  end

  defp route(%{component: "TimeSelect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.TimeSelect} />
    """
  end

  defp route(%{component: "DateTimeSelect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.DateTimeSelect} />
    """
  end

  defp route(%{component: "Link"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Link} />
    """
  end

  defp route(%{component: "LiveRedirect"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.LiveRedirect} />
    """
  end

  defp route(%{component: "LivePatch"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.LivePatch} />
    """
  end

  defp route(%{component: "Form"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.FormInfo id="FormInfo" />
    """
  end

  defp route(%{component: "Field"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.FieldInfo id="FieldInfo" />
    """
  end

  defp route(%{component: "FieldContext"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.FieldContext} />
    """
  end

  defp route(%{component: "Label"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.LabelInfo id="LabelInfo" />
    """
  end

  defp route(%{component: "TextArea"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.TextAreaInfo id="TextAreaInfo" />
    """
  end

  defp route(%{component: "ErrorTag"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Form.ErrorTag} />
    """
  end

  defp route(%{component: "Component"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Dynamic.Component} />
    """
  end

  defp route(%{component: "LiveComponent"} = assigns) do
    ~F"""
    <ComponentInfo module={Surface.Components.Dynamic.LiveComponent} />
    """
  end

  defp route(%{component: "Markdown"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.MarkdownInfo id="MarkdownInfo" />
    """
  end

  defp route(%{component: "Raw"} = assigns) do
    ~F"""
    <SurfaceSiteWeb.BuiltinComponents.RawInfo id="RawInfo" />
    """
  end

  defp route(assigns) do
    ~F"""
    No documentation for component <strong>{@component}</strong> defined.
    """
  end
end
