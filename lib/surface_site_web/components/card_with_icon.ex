defmodule SurfaceSiteWeb.Components.CardWithIcon do
  use Surface.Component

  prop icon, :string, required: true
  prop title, :string, required: true

  slot default

  def render(assigns) do
    ~H"""
    <div class="card" style="box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);">
      <div class="card-image has-text-centered">
        <div class="container">
          <span class="icon is-large has-text-info" style="margin-top: 40px;margin-bottom: 12px;">
            <i class="fas {{ @icon }}" style="font-size: 5em;" />
          </span>
        </div>
      </div>
      <div class="card-content">
        <div class="content">
          <h4 class="has-text-centered">{{ @title }}</h4>
          <slot />
        </div>
      </div>
    </div>
    """
  end
end
