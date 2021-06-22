defmodule SurfaceSiteWeb.TemplateSyntax do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar

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
                  <li><LiveRedirect label="Home" to="/" /></li>
                  <li><LiveRedirect label="Documentation" to="/documentation" /></li>
                  <li class="is-active"><Link to="#" label="Template Syntax" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Template Syntax

                Surface's HTML-centric templating language was designed specifically to improve development
                experience. It provides support for directives, control-flow blocks, syntactic sugar for attribute
                definition and many other features.

                ## Tags and Components

                Regular HTML elements can be injected normally as lowercase tags, like `<div>`, `<button>` or `<br>`.

                A component can be injected using its module name, for instance `<Card>`, `<Grid>` or `<Form>`. The naming
                convention follows the same rules as for any other module name in `Elixir`, i.e., it must be capitalized.

                Tags and components can also be written as self-closing tags, like `<button/>` or `<Footer/>`.

                Void elements defined by the [HTML specs](https://www.w3.org/TR/2011/WD-html-markup-20110113/syntax.html#void-elements),
                can be written in both forms. As self-closing tags, like `<br/>` or in its original form `<br>`.

                ## Built-in Tags and Macro Components

                Some special built-in tags as well as macro components must be injected with the `#` prefix. Currently,
                Surface provides the `<#template>` and `<#slot>` special components and the `<#Raw>` macro component.

                ## Expressions

                Elixir expressions can be wrapped in `{ }` and injected directly in the body of a component or as an attribute/property value.

                ### Example

                ```surface
                <div class={@my_class}>
                  Name: {String.upcase(@name)}
                </div>
                ```

                ## Attributes and props

                Tag attributes and component properties can be defined pretty much the same way you define attributes in HTML.
                The main difference is that Surface extends the syntax, allowing users to pass expressions directly instead of
                only literal strings.

                ### Example

                ```surface
                <div id="123" class={@myclass}>
                  ...
                </div>

                <Card title="My Card" class={@class}>
                  ...
                </Card>
                ```

                ## Boolean attributes

                Whenever you need to render a boolean attribute based on a condition, you can pass that condition directly as an expression:

                ```surface
                <button disabled={@step != :finished}>
                ```

                If the expression evaluates to a truthy value, the atrribute will be rendered, otherwise the whole attribute assignment
                will be suppressed from the rendered HTML.

                ## Shorthand attribute assignment

                When setting attributes/props values, it's common to pass existing assigns or variables that have the same name as the
                attribute being assigned. For convenience, Surface provides a shorthand syntax for that:

                ```surface
                <input {=@class} {=@disabled}>
                ```

                which is equivalent to:

                ```surface
                <input class={@class} disabled={@disabled}>
                ```

                > **Note**: When used in regular HTML tags (not components), if the variable/assign's name contains `_` (underscore),
                they will be automatically converted to `-` (dash), e.g., `{=@data_value}` is translated to `data-value={@data_value}`.

                ## Dynamic attributes/props

                Passing a list of dynamic attributes to a tag or component can be done using the `{... }` shorthand:

                ```surface
                <div id="my_div" {...@dynamic_attrs}>
                  ...
                </div>
                ```

                The attributes can be passed as either a keyword list or a map.

                > **Note**: The concept is very similar to spread attributes in `React` or `Svelte`. However, in Surface this is
                implemented as a [Tagged Expression](/template_syntax#tagged-expressions) as `Elixir` does not provide a
                spread operator like the `...` in `JS`.

                ## Tagged expressions

                Allows the Surface compiler to customize the behaviour of an expression, usually to provide syntactic sugar
                for common code patterns or to change the semantics of a given expression.

                Currently, Surface provides the following built-in tagged expressions:

                  * `{=value}` - Shorthand syntax for passing attributes with name and value matching either `name={name}` or `name={@name}`.

                  * `{...values}` - Shorthand syntax for passing dynamic attributes/props.

                  * `{^variable}` - Injects the AST fragment hold by the given `variable` directly into the compiled AST of the template.
                    It can only be used inside `quote_surface` (usually in a macro component) and the behaviour is analogous to
                    Elixir's `quote` and `unquote`.


                ## Blocks

                Flow-control constructs are defined as **blocks** which may also support optional **sub-blocks**.

                The general syntax of any block is:

                ```surface
                {#block expression}
                  ...
                {/block}
                ```

                Where `block` is the name of the block, for instance, `for`, `if`, `case`, etc. And `expression` is the Elixir expression
                expected by the block, which must always be passed.

                The format for **sub-blocks** is similar but, unlike blocks, they don't require a closing tag:

                ```surface
                {#block expression}
                  ...
                  {#subblock}
                    ...
                  {#subblock expression}
                    ...
                {/block}
                ```

                Passing the `expression` might be required or not depending on the sub-block.

                ## {#if ...}

                Conditionally renders its contents based on the value of the passed expression.

                If the value is `false` or `nil`, the content is suppressed, otherwise it's rendered.

                It also support the optional sub-blocks `{#elseif expression}` and `{#else}`.

                ### Example

                ```surface
                {#if @value == 0}
                  Value is 0
                {#elseif @value > 0}
                  Value is greater than 0
                {#else}
                  Value is lower than 0
                {/if}
                ```

                ## {#unless ...}

                Also conditionally renders its contents based on the value of the passed expression but the behaviour is
                the opposite of `{#if ...}`.

                If the value is `false` or `nil`, the content is rendered, otherwise it's suppressed.

                ### Example

                ```surface
                {#unless @loaded}
                  The data has not been loaded.
                {/unless}
                ```

                ## {#for ...}

                Performs a loop over an `Enumerable`.

                This construct is similar to Elixir's own `for` special form but additionally supports an
                optional `{#else}` sub-block that allows users to render a fallback content in case the
                enumerable is empty.

                ### Example

                ```surface
                {#for item <- @items}
                  Item: {item}
                {#else}
                  No items
                {/for}
                ```

                > **Note:** The `{#else}` sub-block for the `for` construct is only supported when the expression
                > does not contain any filter or multiple generators. Trying to use `{#else}` in such cases will
                > result in a compile-time error raised by the Surface compiler.

                ## {#case ...}

                Compares the value of the given expression against each `{#match pattern}` until it finds a matching one.

                ### Example

                ```surface
                {#case @value}
                  {#match [first|_]}
                    First {first}
                  {#match []}
                    Value is empty
                  {#match _}
                    Value is something else
                {/case}
                ```

                ## Directives

                Directives are built-in attributes that can modify the translated code of a tag or component at compile time.

                ### Example

                ```surface
                <div :if={@loading}>
                  Loading ...
                </div>
                ```

                Currently, the following directives are supported:

                  * `:if` - Conditionally render a tag (or component). The code will be rendered if the expression
                    is evaluated to a truthy value.

                  * `:show` - Conditionally shows/hides an HTML tag, keeping the rendered element in the DOM even
                    when the value is `false`.

                  * `:let` - Declares which slot arguments will be used in the current scope.

                  * `:args` - Used in `<#slot>`, it passes slot arguments from the slot's scope to the associated content
                    that is being prepared to fill the slot. For more information see section "**Slots props**"
                    in the [Slots](/slots) documentation.

                  * `:on-[event]` - Sets a `phx-*` event binding defining the component itself as the
                    default handler (target). This is the preferred way to use `phx` events in **Surface** as it can
                    properly handle properties of type `:event`. Available directives are: `:on-click`,
                    `:on-capture-click`, `:on-blur`, `:on-focus`, `:on-change`, `:on-submit`, `:on-keydown`,
                    `:on-keyup`, `:on-window-focus`, `:on-window-blur`, `:on-window-keydown` and `:on-window-keyup`.

                  * `:values` - Defines a list of values to be sent to the server when dispatching events. It generates
                    multiple `phx-value-*`. One for each key-value passed, e.g., `<div :values={id: @id, group: @group}>`.
                    The list of values can be either a keyword list or a map. The values will always be serialized as **strings**.

                  * `:for` - Iterates over a list (generator) and renders the content of the tag (or component)
                    for each item in the list.

                    > **Soft deprecation alert:** It's recommended to use the `{#for ...}` block instead of `:for`
                    > as there are plans to remove this directive in future versions.

                  * `:attrs` and `:props` - Passes dynamic properties to a HTML tags and component, respectively.
                    > **Soft deprecation alert:** It's recommended to use `{... }` instead of `:attrs` and `:props` as
                    > there are plans to remove those directives in future versions.

                ## Comments

                There are two types for comments that can be injected into a Surface template, **public** and **private**.

                Public comments are always sent to the browser and can be defined using the standard HTML comment syntax `<!-- -->`.

                Private comments, on the other hand, are not sent to the browser and should be defined using `{!-- --}` instead.

                ### Example

                ```surface
                ...

                <!-- This comment will be sent to the browser -->

                ...

                {!-- This comment won't be sent to the browser --}
                ```
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/documentation">
                ← Introduction
              </LiveRedirect>
              <LiveRedirect class="nav-prev-next-next" to="/components_basics">
                Components Basics →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
