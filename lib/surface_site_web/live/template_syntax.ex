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

                ## Built-in Tags and Macro Components

                Some special built-in tags as well as macro components must be injected with the `#` prefix. Currently,
                Surface provides the `<#template>` and `<#slot>` special components and the `<#Raw>` macro component.

                ## Attributes and props

                Attributes can be defined pretty much the same way you define attributes in HTML. The main difference is that
                Surface extends the syntax to allow attributes to receive values as expressions.

                ### Example

                ```surface
                <div id="123" class={@myclass}>
                  ...
                </div>
                ```

                Components' properties can also be set using an attribute-like notation.

                ### Example

                ```surface
                <Card title="My Card" class={@class}>
                  ...
                </Card>
                ```

                ## Expressions

                Expressions can be wrapped in `{ }` and injected directly in the body of a component or as an attribute/property value.

                ### Example

                ```surface
                <div class={@my_class}>
                  Name: {String.upcase(@name)}
                </div>
                ```

                ## Tagged expressions

                Allows the Surface compiler to customize the behaviour of an expression, usually to provide syntactic sugar
                for common code patterns or to change the semantics of a given expression.

                Currently, Surface provides the following built-in tagged expressions:

                  * `{=value}` - Shorthand syntax for passing attributes with name and value matching either `name={name}` or `name={@name}`.
                    For instance, `{=@selected}` is equivalent to `selected={@selected}`

                  * `{...values}` - Shorthand syntax for passing dynamic attributes. For instance `<div {...@values}>`, where `@values` is either
                    a keyword list or a map. When used in the context of a HTML tag.

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

                Where `block` is the name of the block, like `if`, `for`, etc. The `expression` must always be passed.

                The format for **sub-blocks** is similar but unlike blocks, they don't require a closing tag:

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

                  * `:for` - Iterates over a list (generator) and renders the content of the tag (or component)
                    for each item in the list.

                    > **Soft deprecation alert:** It's recommended to use the `{#for ...}` block instead of `:for`
                    > as there are plans to remove this directive in future versions.

                  * `:attrs` and `:props` - Passes dynamic properties to a HTML tags and component, respectively.
                    > **Soft deprecation alert:** It's recommended to use `{... }` instead of `:attrs` and `:props` as
                    > there are plans to remove those directives in future versions.

                ### Modifiers

                Directives can also have modifiers that allow users to customize their behaviour.

                For instance, the `:for` directive has two modifiers, `index` and `with_index`. Both
                are mostly used when rendering named slots:

                Using `index`:

                Example 1

                ```surface
                <td :for.index={@cols}>
                  <#slot name="cols" index={index}/>
                </td>
                ```

                Example 2

                ```surface
                <td :for.index={i <- @cols}>
                  <#slot name="cols" index={i}/>
                </td>
                ```

                Using `with_index`:

                ```surface
                <td :for.with_index={{col, i} <- @cols}>
                  Title: {col.title}
                  <#slot name="cols" index={i}/>
                </td>
                ```

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
