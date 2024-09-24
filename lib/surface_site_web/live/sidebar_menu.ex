defmodule SurfaceSiteWeb.SidebarMenu do
  use Surface.Component

  def render(assigns) do
    ~F"""
    <ul class="menu-list">
      <li>
        <.link navigate="/">
          <span class="icon">
            <i class="fa fa-home" />
          </span>
          Home
        </.link>
      </li>
      <li>
        <.link class="" navigate="/blog">
          <span class="icon">
            <i class="fas fa-edit" />
          </span>
          Blog
        </.link>
      </li>
      <li>
        <.link class="" navigate="/getting_started">
          <span class="icon">
            <i class="fa fa-power-off" />
          </span>
          Getting started
        </.link>
      </li>
      <li>
        <.link class="" navigate="/documentation">
          <span class="icon">
            <i class="fa fa-book" />
          </span>
          Documentation
        </.link>
        <ul>
          <li>
            <.link class="" navigate="/template_syntax">
              <span class="icon">
                <i class="fa fa-code" />
              </span>
              Template Syntax
            </.link>
          </li>
          <li>
            <.link class="" navigate="/components_basics">
              <span class="icon">
                <i class="far fa-file-code" />
              </span>
              Components Basics
            </.link>
          </li>
          <li>
            <.link class="" navigate="/properties">
              <span class="icon">
                <i class="fa fa-cubes" />
              </span>
              Properties
            </.link>
          </li>
          <li>
            <.link class="" navigate="/data">
              <span class="icon">
                <i class="fa fa-cube" />
              </span>
              Data
            </.link>
          </li>
          <li>
            <.link class="" navigate="/events">
              <span class="icon">
                <i class="fa fa-bolt" />
              </span>
              Events
            </.link>
          </li>
          <li>
            <.link class="" navigate="/slots">
              <span class="icon">
                <svg
                  class="svg-inline--fa fa-align-left fa-w-14"
                  aria-hidden="true"
                  data-prefix="fas"
                  data-icon="align-left"
                  role="img"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 448 512"
                  data-fa-i2svg=""
                ><path
                    fill="currentColor"
                    d="M288 44v40c0 8.837-7.163 16-16 16H16c-8.837 0-16-7.163-16-16V44c0-8.837 7.163-16 16-16h256c8.837 0 16 7.163 16 16zM0 172v40c0 8.837 7.163 16 16 16h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16zm16 312h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm256-200H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16h256c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16z"
                  /></svg>
              </span>
              Slots
            </.link>
          </li>
          <li>
            <.link class="" navigate="/state_management">
              <span class="icon">
                <i class="fa fa-exchange-alt" />
              </span>
              State Management
            </.link>
          </li>
          <li>
            <.link class="" navigate="/contexts">
              <span class="icon">
                <i class="fa fa-sitemap" />
              </span>
              Contexts
            </.link>
          </li>
          <li>
            <.link class="" navigate="/testing">
              <span class="icon">
                <i class="fas fa-tasks" />
              </span>
              Testing
            </.link>
          </li>
          <li>
            <.link class="" navigate="/js_interop">
              <span class="icon">
                <i class="fab fa-js-square" />
              </span>
              JS Interoperability
            </.link>
          </li>
          <li>
            <.link class="" navigate="/scoped_css">
              <span class="icon">
                <i class="fa fa-list-alt" />
              </span>
              Scoped CSS
            </.link>
          </li>
          <li>
            <.link class="" navigate="/layouts_and_dead_views">
              <span class="icon">
                <svg
                  class="svg-inline--fa fa-align-left fa-w-14"
                  aria-hidden="true"
                  role="img"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 448 512"
                >
                  <path
                    fill="currentColor"
                    d="M0,0v512h512V0H0z M469.333,234.667h-192v-192h192V234.667z M42.667,42.667h192v426.667h-192V42.667z M277.333,469.333 v-192h192v192H277.333z"
                  />
                </svg>
              </span>
              Layouts &amp; dead views
            </.link>
          </li>
        </ul>
      </li>
      <li>
        <.link class="" navigate="/builtincomponents">
          <span class="icon">
            <i class="fa fa-code" />
          </span>
          Built-in Components
        </.link>
        <ul>
          <li>
            <p class="sidebar-label">Navigation</p>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/Link">
              <span class="icon is-small">
                <i class="fas fa-link" />
              </span>
              Link
            </.link>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/LivePatch">
              <span class="icon is-small">
                <i class="fas fa-external-link-square-alt" />
              </span>
              LivePatch
            </.link>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/LiveRedirect">
              <span class="icon is-small">
                <i class="fa fa-external-link-alt" />
              </span>
              LiveRedirect
            </.link>
          </li>
          <li>
            <p class="sidebar-label">Other</p>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/Markdown">
              <span class="icon is-small">
                <i class="fab fa-markdown" />
              </span>
              Markdown
            </.link>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/Raw">
              <span class="icon is-small">
                <i class="far fa-file-code" />
              </span>
              Raw
            </.link>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/Component">
              <span class="icon is-small">
                <i class="fa fa-code" />
              </span>
              Component (dynamic)
            </.link>
          </li>
          <li>
            <.link class="" navigate="/builtincomponents/LiveComponent">
              <span class="icon is-small">
                <i class="fa fa-code" />
              </span>
              LiveComponent (dynamic)
            </.link>
          </li>
        </ul>
      </li>
      <li>
        <.link class="" navigate="/samplecomponents">
          <span class="icon">
            <i class="fa fa-puzzle-piece" />
          </span>
          Sample UI Components
        </.link>
        <ul>
          <li>
            <.link class="" navigate="/samplecomponents/Button">
              <span class="icon is-small">
                <i class="fa fa-hand-pointer" />
              </span>
              Button
            </.link>
          </li>
          <li>
            <.link class="" navigate="/samplecomponents/Table">
              <span class="icon is-small">
                <i class="fa fa-table" />
              </span>
              Table
            </.link>
          </li>
          <li>
            <.link class="" navigate="/samplecomponents/Tabs">
              <span class="icon is-small">
                <i class="fa fa-folder" />
              </span>
              Tabs
            </.link>
          </li>
        </ul>
      </li>
    </ul>
    """
  end
end
