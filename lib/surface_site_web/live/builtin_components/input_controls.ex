defmodule SurfaceSiteWeb.BuiltinComponents.InputControls do
  use Surface.LiveComponent

  alias Surface.Components.Markdown

  def render(assigns) do
    ~H"""
    <div class="component-group">
      <h1 class="title">Input controls</h1>
      <h2 class="subtitle">
        A set of common <strong>input controls</strong> based on the <code>&lt;input&gt;</code> element.
      </h2>
      <hr>
      <#Markdown>
        > **Note**: All input controls are wrappers around existing Phoenix built-in helpers.

        ## Common

        * [TextInput](/builtincomponents/TextInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter a **single-line text**.

        * [RadioButton](/builtincomponents/RadioButton){: data-phx-link="redirect" data-phx-link-state="push"} -
          A button normally presented in **radio groups** defining a set of related options.

        * [HiddenInput](/builtincomponents/HiddenInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          A **hidden** input field.

        * [Checkbox](/builtincomponents/Checkbox){: data-phx-link="redirect" data-phx-link-state="push"} -
          Defines a **checkbox**.

        * [Inputs](/builtincomponents/Inputs){: data-phx-link="redirect" data-phx-link-state="push"} -
          A wrapper for `Phoenix.HTML.Form.html.inputs_for/3`.

        ## Other

        * [ColorInput](/builtincomponents/ColorInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user specify a **color**, either with a text field or a color picker interface.

        * [DateInput](/builtincomponents/DateInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter a **date**, either with a text field or a date picker interface.

        * [DateTimeLocalInput](/builtincomponents/DateTimeLocalInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter both **date** and **time**, using a text field and a date picker interface.

        * [EmailInput](/builtincomponents/EmailInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter one or multiple **e-mails**.

        * [NumberInput](/builtincomponents/NumberInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user to enter a **number**.

        * [PasswordInput](/builtincomponents/PasswordInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user securely specify a **password**.

        * [RangeInput](/builtincomponents/RangeInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user specify a numeric value in a given **range**, usually using a slider.

        * [SearchInput](/builtincomponents/SearchInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter **search** queries.

        * [TelephoneInput](/builtincomponents/TelephoneInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter a **telephone number**.

        * [TimeInput](/builtincomponents/TimeInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter a **time** (hours, minutes and optionally seconds).

        * [UrlInput](/builtincomponents/UrlInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          An input field that let the user enter a **URL**.

        * [FileInput](/builtincomponents/FileInput){: data-phx-link="redirect" data-phx-link-state="push"} -
          Generates a file input.

        * [HiddenInputs](/builtincomponents/HiddenInputs){: data-phx-link="redirect" data-phx-link-state="push"} -
          A wrapper for `Phoenix.HTML.Form.html.hidden_inputs_for/1`.
      </#Markdown>
    </div>
    """
  end
end
