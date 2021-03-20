defmodule SurfaceSiteWeb.Slots do
  use Surface.LiveView

  alias Surface.Components.{Link, LiveRedirect, Raw, Markdown}
  alias SurfaceSiteWeb.Sidebar
  alias SurfaceSiteWeb.MobileSidebar
  alias SurfaceSiteWeb.Components.Code

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
                  <li><LiveRedirect label="Documentation" to="/documentation" /></li>
                  <li class="is-active"><Link to="#" label="Slots" /></li>
                </ul>
              </nav>
              <#Markdown>
                # Slots

                Slots are **placeholders** declared by a component that you can fill up with **custom content**.

                In order to declare a slot, you must use the `slot` function:

                > _**slot** name, options_

                Where:

                  * `name` - is the name of the slot.
                  * `options` - a keyword list of options for additional customization.

                ### Supported options

                  * `required` - declares the slot as required. Default is `false`.
                  * `props` - the list of custom properties that should be passed to the associated
                    slotable content.
                  * `as` - defines the slot assign name. Useful if you want to reuse the slot name as a prop.

                ## Rendering content with `<slot>`

                Slots are similar to properties as they are exposed as part of the component's **public API**.
                The main difference is that while properties are passed as attributes, slots are injected inside
                the component's body.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Hero</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">section</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero is-info"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero-body"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">section</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Fallback content

                Sometimes it’s useful to specify a fallback content that should be rendered when no content
                is provided for a slot.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                  <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">section</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero is-info"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero-body"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        No content defined!</div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">section</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                By defining any children inside `<slot>...</slot>`, that content becomes the default content.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.SlotFallbackExample.Example />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Hero</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Declaring slots

                Slots defined using `<slot/>` are automatically registered into the component's metadata.
                That means you don't have to explicitly declare them using the `slot` function. However,
                since a slot is also part of the public API, it's advisable to declare it
                so you can add proper documentation to it. Additionally, if you want Surface to **statically
                validate** required slots and slot props, you also need to declare them.

                The following updated version of the `Hero` component explicitly declares the default slot.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Hero</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The content of the Hero"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">default</span>, required: <span style="color: rgb(86, 156, 214);">true</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">section</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero is-info"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"hero-body"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">section</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Now, if the user tries to use a `Hero` without defining any content, a proper
                `missing required slot "default"` error will be raised at compile-time.

                ![Missing required slot](/images/slots_required_slot_error.png)

                ## Named slots

                In the previous example, we defined a component with a single default slot. But what
                if you need to define multiple slots? A classical example of such requirement is the `Card`
                component. A card usually has three distinct areas, a **header**, a **footer** and the
                main **content**.

                In order to create a component that can represent a card, we need to use **named slots**. Let's take a look at
                how it works.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.NamedSlotsExample.Example />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Card</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">template</span> <span style="color: rgb(156, 220, 254);">slot</span>=<span style="color: rgb(206, 145, 120);">"header"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          A simple card component</div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">template</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div>        This example demonstrates how to create components with multiple slots.</div><div>        It defines a <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>default<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span> slot to hold the card's content</div><div>        and two <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>named slots<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>: header and footer.</div><br><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">template</span> <span style="color: rgb(156, 220, 254);">slot</span>=<span style="color: rgb(206, 145, 120);">"footer"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">a</span> <span style="color: rgb(156, 220, 254);">href</span>=<span style="color: rgb(206, 145, 120);">"#"</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-footer-item"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Footer Item 1<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">a</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">a</span> <span style="color: rgb(156, 220, 254);">href</span>=<span style="color: rgb(206, 145, 120);">"#"</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-footer-item"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Footer Item 2<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">a</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">template</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Card</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                And finally our `Card` component defining all three slots:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Card</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The header"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">header</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The footer"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">footer</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The main content"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">default</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">header</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-header"</span> <span style="color: rgb(156, 220, 254);">style</span>=<span style="color: rgb(206, 145, 120);">"background-color: #f5f5f5"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">p</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-header-title"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"header"</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">p</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">header</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-content"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"content"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">footer</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-footer"</span> <span style="color: rgb(156, 220, 254);">style</span>=<span style="color: rgb(206, 145, 120);">"background-color: #f5f5f5"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">name</span>=<span style="color: rgb(206, 145, 120);">"footer"</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">footer</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Pay attention that defining a `<slot/>` without a name is the same as defining it as
                `<slot name="default"/>`.

                ## Typed slotables

                Instead of using `<template slot="...">`, you might want to define a custom component to
                hold the slot's content. In our case, we can define a `<Footer>` and a `<Header>`
                component, setting the `:slot` option as the name of the slot in the parent card.
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Header</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span>, slot: <span style="color: rgb(206, 145, 120);">"header"</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Footer</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span>, slot: <span style="color: rgb(206, 145, 120);">"footer"</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                To use them, we don't have to change anything in the `Card` component. We just need to replace each `<template>`
                with the appropriate `Footer` or `Header` component.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.Slots.TypedSlotsExample.Example />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Card</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Header</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      A simple card component</div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Header</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div>    This is the same Card component but now we're using</div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>typed slotables<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span> instead of <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>templates<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>.</div><br><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Footer</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">a</span> <span style="color: rgb(156, 220, 254);">href</span>=<span style="color: rgb(206, 145, 120);">"#"</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-footer-item"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Footer Item 1<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">a</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">a</span> <span style="color: rgb(156, 220, 254);">href</span>=<span style="color: rgb(206, 145, 120);">"#"</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"card-footer-item"</span><span style="color: rgb(128, 128, 128);">&gt;</span>Footer Item 2<span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">a</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Footer</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>  <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Card</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Slot props

                There are cases when it's necessary to pass information from the child's scope to
                the corresponding slot content that is being injected by the parent. Using **slot props**, Surface
                gives you an extra layer of encapsulation as it allows you to expose only the pieces
                of data that the parent needs, keeping everything else in the child's scope private
                to the parent.

                Imagine you're developing a new component that you need to show some ratings.
                It should provide predefined buttons to increment/decrement its value but you want
                to make the rendering of the value itself customizable so you can, let's say, show
                it as a number in one page and as a list of stars in another. You also want to
                define a property for the `max` value.

                Let's see the code:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Rating</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The maximum value"</span></div><div>    <span style="color: rgb(78, 201, 176);">prop</span> <span style="color: rgb(156, 220, 254);">max</span>, :integer, default: <span style="color: rgb(181, 206, 168);">5</span></div><br><div>    <span style="color: rgb(106, 153, 85);">@doc "The content"</span></div><div>    <span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">default</span>, props: [:value, :max]</div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">value</span>, :integer, default: <span style="color: rgb(181, 206, 168);">1</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">p</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">slot</span> <span style="color: rgb(156, 220, 254);">:props</span>=<span style="color: rgb(86, 156, 214);">{{</span> value: <span style="color: rgb(156, 220, 254);">@value</span>, max: <span style="color: rgb(156, 220, 254);">@max</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">/&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">p</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span> <span style="color: rgb(156, 220, 254);">style</span>=<span style="color: rgb(206, 145, 120);">"padding-top: 10px;"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"dec"</span> <span style="color: rgb(156, 220, 254);">disabled</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@value</span> == <span style="color: rgb(181, 206, 168);">1</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            -</div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">button</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"button is-info"</span> <span style="color: rgb(156, 220, 254);">:on-click</span>=<span style="color: rgb(206, 145, 120);">"inc"</span> <span style="color: rgb(156, 220, 254);">disabled</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@value</span> == <span style="color: rgb(156, 220, 254);">@max</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            +</div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">button</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"inc"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :value, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> + <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">handle_event</span>(<span style="color: rgb(206, 145, 120);">"dec"</span>, <span style="color: rgb(106, 153, 85);">_</span>, socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:noreply, update(socket, :value, <span style="color: rgb(156, 220, 254);">&amp;</span> <span style="color: rgb(156, 220, 254);">&amp;1</span> - <span style="color: rgb(181, 206, 168);">1</span>)}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Now let's create two instances of our `Rating` component, each one rendering its
                value differently.
              </#Markdown>

              <div class="card dark">
                <div class="card-content slots-page-props-example">
                  <SurfaceSiteWeb.Slots.SlotPropsExample.Example id="slot_props_example" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">Component</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Rating</span> <span style="color: rgb(156, 220, 254);">:let</span>=<span style="color: rgb(86, 156, 214);">{{</span> value: value <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">id</span>=<span style="color: rgb(206, 145, 120);">"rating_1"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">h1</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"title is-marginless"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            Rating: <span style="color: rgb(86, 156, 214);">{{</span> value <span style="color: rgb(86, 156, 214);">}}</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">h1</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Rating</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">hr</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Rating</span> <span style="color: rgb(156, 220, 254);">:let</span>=<span style="color: rgb(86, 156, 214);">{{</span> value: value, max: max <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">id</span>=<span style="color: rgb(206, 145, 120);">"rating_2"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">span</span> <span style="color: rgb(156, 220, 254);">:for</span>=<span style="color: rgb(86, 156, 214);">{{</span> i &lt;- <span style="color: rgb(181, 206, 168);">1</span>..max <span style="color: rgb(86, 156, 214);">}}</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(86, 156, 214);">{{</span> :icon, "has-text-warning": i &lt;= value <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>              <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">i</span> <span style="color: rgb(156, 220, 254);">class</span>=<span style="color: rgb(206, 145, 120);">"fas fa-star"</span><span style="color: rgb(128, 128, 128);">&gt;&lt;/</span><span style="color: rgb(86, 156, 214);">i</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>            <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">span</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Rating</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                ## Renderless components

                There are cases when you don't need to render any of the children of a specific component.
                You just want to use them as a list of values that can be retrieved so you can provide a more
                declarative way to configure that component.

                Imagine you want to define a `Grid` component but instead of defining a property to pass
                the columns definitions, you want to extract that information directly from the component's body.
                In order to achieve that, you can define a `Column` component and use the `:slot` option to
                inform that any instance will be bound to a parent slot.

                By doing that, the component will no longer be rendered automatically. The list of children
                belonging to the same slot will be grouped and become available to the parent as an **assign**.
                The parent then decides what should be done with each individual group (slot).

                Here's an example:
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.GettingStarted.RenderlessComponent.Example id="renderless_component" />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">defmodule</span> <span style="color: rgb(78, 201, 176);">Example</span> <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(86, 156, 214);">use</span> <span style="color: rgb(156, 220, 254);">Surface</span>.<span style="color: rgb(156, 220, 254);">LiveComponent</span></div><br><div>    <span style="color: rgb(78, 201, 176);">data</span> <span style="color: rgb(156, 220, 254);">albums</span>, :list, default: []</div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">mount</span>(socket) <span style="color: rgb(197, 134, 192);">do</span></div><div>      {:ok, assign(socket, albums: [</div><div>        %{name: <span style="color: rgb(206, 145, 120);">"The Dark Side of the Moon"</span>, artist: <span style="color: rgb(206, 145, 120);">"Pink Floyd"</span>, released: <span style="color: rgb(206, 145, 120);">"March 1, 1973"</span>},</div><div>        %{name: <span style="color: rgb(206, 145, 120);">"OK Computer"</span>, artist: <span style="color: rgb(206, 145, 120);">"Radiohead"</span>, released: <span style="color: rgb(206, 145, 120);">"June 16, 1997"</span>},</div><div>        %{name: <span style="color: rgb(206, 145, 120);">"Disraeli Gears"</span>, artist: <span style="color: rgb(206, 145, 120);">"Cream"</span>, released: <span style="color: rgb(206, 145, 120);">"November 2, 1967"</span>, selected: <span style="color: rgb(86, 156, 214);">true</span>},</div><div>        %{name: <span style="color: rgb(206, 145, 120);">"Physical Graffiti"</span>, artist: <span style="color: rgb(206, 145, 120);">"Led Zeppelin"</span>, released: <span style="color: rgb(206, 145, 120);">"February 24, 1975"</span>}</div><div>      ])}</div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><br><div>    <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>      <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Grid</span> <span style="color: rgb(156, 220, 254);">items</span>=<span style="color: rgb(86, 156, 214);">{{</span> <span style="color: rgb(156, 220, 254);">@albums</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Column</span> <span style="color: rgb(156, 220, 254);">field</span>=<span style="color: rgb(206, 145, 120);">"name"</span><span style="color: rgb(128, 128, 128);"> /&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Column</span> <span style="color: rgb(156, 220, 254);">field</span>=<span style="color: rgb(206, 145, 120);">"artist"</span><span style="color: rgb(128, 128, 128);"> /&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Column</span> <span style="color: rgb(156, 220, 254);">field</span>=<span style="color: rgb(206, 145, 120);">"released"</span><span style="color: rgb(128, 128, 128);"> /&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Grid</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(197, 134, 192);">end</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div><span style="color: rgb(197, 134, 192);"></span></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Here are the `Grid` and `Column` components:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.GettingStarted.RenderlessComponent.Example }}
                    line_range={{ 2..38 }}
                    show_line_numbers
                  />
                </footer>
              </div>

              <#Markdown>
                By defining a named slot `cols`, we instruct Surface to create a new assign named
                `@cols` that will hold a list containing all children that belong to the slot `cols`.

                > **Note**: As you can see, the `Column` component does not render anything. It just holds the
                provided values for its properties. All the rendering is done by the parent `Grid`.

                ## Binding slot props to generators

                Imagine that instead of passing the field related to the column,
                you want to define some markup that should be rendered for each column. This would
                give us much more flexibility to render the items. Here's an example of what we could do.
              </#Markdown>

              <div class="card dark">
                <div class="card-content">
                  <SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators.Example />
                </div>
                <footer class="card-footer">
                  <#Raw>
                    <div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Menlo, Monaco, &quot;Courier New&quot;, monospace; line-height: 26px; white-space: pre;"><br><div>  <span style="color: rgb(197, 134, 192);">def</span> <span style="color: rgb(220, 220, 170);">render</span>(assigns) <span style="color: rgb(197, 134, 192);">do</span></div><div>    <span style="color: rgb(206, 145, 120);">~H&quot;&quot;&quot;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Grid</span> <span style="color: rgb(156, 220, 254);">items</span>=<span style="color: rgb(86, 156, 214);">{{</span> album &lt;- <span style="color: rgb(156, 220, 254);">@albums</span> <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Column</span> <span style="color: rgb(156, 220, 254);">title</span>=<span style="color: rgb(206, 145, 120);">"Title"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(86, 156, 214);">{{</span> album.name<span style="color: rgb(86, 156, 214);">}}</span> (Released: <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span><span style="color: rgb(86, 156, 214);">{{</span> album.released <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">strong</span><span style="color: rgb(128, 128, 128);">&gt;</span>)</div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Column</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(78, 201, 176);">Column</span> <span style="color: rgb(156, 220, 254);">title</span>=<span style="color: rgb(206, 145, 120);">"Artist"</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>          <span style="color: rgb(128, 128, 128);">&lt;</span><span style="color: rgb(86, 156, 214);">a</span> <span style="color: rgb(156, 220, 254);">href</span>=<span style="color: rgb(206, 145, 120);">"#"</span><span style="color: rgb(128, 128, 128);">&gt;</span><span style="color: rgb(86, 156, 214);">{{</span> album.artist <span style="color: rgb(86, 156, 214);">}}</span><span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">a</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>        <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Column</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>      <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(78, 201, 176);">Grid</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(128, 128, 128);">&lt;/</span><span style="color: rgb(86, 156, 214);">div</span><span style="color: rgb(128, 128, 128);">&gt;</span></div><div>    <span style="color: rgb(206, 145, 120);">&quot;&quot;&quot;</span></div><div>  <span style="color: rgb(197, 134, 192);">end</span></div><br><div></div></div>
                  </#Raw>
                </footer>
              </div>

              <#Markdown>
                Notice that we're not passing a regular list to the property `items` anymore, instead, we are
                passing a **generator** that defines a variable called `album`. That variable will hold
                the value of each item in the list that will be passed back to the column's scope by the
                parent `Grid`.

                > **Note**: Currently, Surface only support generators defining a single variable. Optional
                filter expressions are also supported. The concept of **generators** and **filters** is the
                same used by **comprehensions** in Elixir. For more information, see the section
                [Generators and filters](https://elixir-lang.org/getting-started/comprehensions.html#generators-and-filters)
                in the Elixir official documentation.

                Here's the updated version of the `Column` and `Grid` components:
              </#Markdown>

              <div class="card dark">
                <footer class="card-footer">
                  <#Code
                    language="elixir"
                    module={{ SurfaceSiteWeb.GettingStarted.BindingSlotsToGenerators.Example }}
                    line_range={{ 2..38 }}
                    show_line_numbers
                    selected_lines="15,29-30"
                  />
                </footer>
              </div>

              <#Markdown>
                Let's take a closer look at the two important changes we made in our `Grid`:

                  1. The `cols` slot now declares a slot prop `item`
                    but instead of just defining the name of the prop (as we did for our `Rating` component),
                    we bound the value of that prop to each value (item) produced by the generator `items`.

                  1. We use `<slot>` to render each column's content passing the current item.
              </#Markdown>
            </div>
            <nav class="nav-prev-next">
              <LiveRedirect to="/events">
                ← Events
              </LiveRedirect>
              <LiveRedirect to="/state_management">
                State Management →
              </LiveRedirect>
            </nav>
          </div>
        </section>
      </div>
    </div>
    """
  end
end
