defmodule SurfaceSiteWeb.Contexts.Example01 do
  defmodule User do
    use Ecto.Schema
    import Ecto.Changeset

    schema "users" do
      field(:email, :string)
      field(:name, :string)
    end

    @email ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    def changeset(user, attrs \\ %{}) do
      user
      |> cast(attrs, [:name, :email])
      |> validate_required([:name, :email])
      |> validate_format(:email, @email, message: "must be a valid email address")
    end

    def validate(params) do
      changeset =
        %User{}
        |> changeset(params)
        |> Map.put(:action, :insert)

      data =
        changeset
        |> Ecto.Changeset.apply_changes()
        |> format()

      {changeset, data}
    end

    defp format(user) do
      user
      |> Map.from_struct()
      |> Map.delete(:__meta__)
      |> Map.delete(:id)
      |> Jason.encode!(pretty: true)
    end
  end

  defmodule ExamplePhoenix do
    use Surface.LiveView

    import Phoenix.HTML.{Form, Tag}

    def mount(_params, _session, socket) do
      {changeset, data} = User.validate(%{"name" => "John Doe"})
      {:ok, assign(socket, %{changeset: changeset, data: data})}
    end

    def render(assigns) do
      ~L"""
      <div class="columns">
        <div class="column">
          <%= form = form_for @changeset, "#", phx_change: :validate, autocomplete: "off" %>
            <div class="field">
              <%= label form, :name, class: "label" %>
              <div class="control">
                <%= text_input form, :name, class: input_class(form, :name) %>
                <%= error_tag form, :name %>
              </div>
            </div>
            <div class="field">
              <%= label form, :email, class: "label" %>
              <div class="control">
                <%= text_input form, :email, class: input_class(form, :email), placeholder: "Try me!" %>
                <%= error_tag form, :email %>
              </div>
            </div>
          </form>
        </div>
        <div class="column">
      <pre style="height: 170px; border-radius: 6px; padding: 2.25rem">
      <%= @data %>
      </pre>
        </div>
      </div>
      """
    end

    def handle_event("validate", %{"user" => params}, socket) do
      {changeset, data} = User.validate(params)
      {:noreply, assign(socket, changeset: changeset, data: data)}
    end

    def handle_event("save", params, socket) do
      %{"user" => user_params} = params
      {:noreply, assign(socket, data: inspect(user_params))}
    end

    defp input_class(form, field) do
      "input" <> if Keyword.has_key?(form.errors, field), do: " is-danger", else: ""
    end

    defp error_tag(form, field) do
      Enum.map(Keyword.get_values(form.errors, field), fn {error, _} ->
        content_tag(:p, error, class: "help is-danger")
      end)
    end
  end

  defmodule Form do
    use Surface.Component

    import Phoenix.HTML.Form
    alias Surface.Components.Raw

    prop for, :any, required: true
    prop change, :event
    prop autocomplete, :string, values: ["on", "off"]

    slot default

    def render(assigns) do
      ~H"""
      {{ form =
        form_for(@for, "#",
          phx_change: assigns.change.name,
          autocomplete: assigns.autocomplete
        ) }}
      <Context put={{ form: form }}>
        <slot />
      </Context>
      <#Raw></form></#Raw>
      """
    end
  end

  defmodule Field do
    use Surface.Component

    import Phoenix.HTML.{Form, Tag}

    @doc "The field name"
    prop name, :string, required: true

    slot default

    def render(assigns) do
      ~H"""
      <div class="field">
        <Context get={{ form: form }}>
          {{ label(form, @name, class: "label") }}
          <div class="control">
            <Context put={{ field: String.to_atom(@name) }}>
              <slot />
            </Context>
            {{ error_tag(form, @name) }}
          </div>
        </Context>
      </div>
      """
    end

    defp error_tag(form, field) do
      Enum.map(Keyword.get_values(form.errors, String.to_atom(field)), fn {error, _} ->
        content_tag(:p, error, class: "help is-danger")
      end)
    end
  end

  defmodule TextInput do
    use Surface.Component

    import Phoenix.HTML.Form

    prop placeholder, :string

    def render(assigns) do
      ~H"""
      <Context get={{ form: form, field: field }}>
        {{ text_input(form, field,
          class: css_class(["input", isDanger: Keyword.has_key?(form.errors, field)]),
          placeholder: @placeholder
        ) }}
      </Context>
      """
    end
  end

  defmodule Example do
    use Surface.LiveView

    data changeset, :changeset
    data data, :any

    def mount(_params, _session, socket) do
      {changeset, data} = User.validate(%{"name" => "John Doe"})
      {:ok, assign(socket, %{changeset: changeset, data: data})}
    end

    def render(assigns) do
      ~H"""
      <div class="columns">
        <div class="column">
          <Form for={{ @changeset }} change="validate" autocomplete="off">
            <Field name="name">
              <TextInput />
            </Field>
            <Field name="email">
              <TextInput placeholder="Try me!" />
            </Field>
          </Form>
        </div>
        <div class="column">
          <pre style="height: 170px; border-radius: 6px; padding: 2.25rem">
      {{ @data }}
      </pre>
        </div>
      </div>
      """
    end

    def handle_event("validate", %{"user" => params}, socket) do
      {changeset, data} = User.validate(params)
      {:noreply, assign(socket, changeset: changeset, data: data)}
    end

    def handle_event("save", params, socket) do
      %{"user" => user_params} = params
      {:noreply, assign(socket, data: inspect(user_params))}
    end
  end
end
