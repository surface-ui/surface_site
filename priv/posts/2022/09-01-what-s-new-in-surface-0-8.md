%{
  title: "What's new in Surface v0.8?",
  author: "Marlus Saraiva",
  tags: ~w(surface releases CSS contexts tailwind catalogue),
  description: """
  Surface v0.8 is out! This version ships with some new exciting features like
  scoped CSS styles, extended context API and more.
  """
}
---

**Surface v0.8** is out with new features, major improvements and fixes. The full changelog can
be found [here](https://github.com/surface-ui/surface/blob/main/CHANGELOG.md#v080-2022-09-01).

A [migration guide](https://github.com/surface-ui/surface/blob/v0.8.0/MIGRATING.md) is also provided with
more information about running `mix surface.convert` to help you migrate your code from `v0.7` to `v0.8`.

Now, let's take a look at some of the new features.

## Scoped CSS styles

When defining a component or LiveView, you can now declare its CSS styles directly in the template
using `<style>` or in a colocated `.css` file. The Surface compiler will treat those styles as scoped
styles so any CSS declaration will apply only to the related component.

Some of the benefits are:

  * Better code organization as each component style can be defined alongside its component
  * Avoid conflicts between components rules as each declaration is scoped per component
  * Prevent CSS rules from the parent components from leaking into children elements or other
    components.
  * Support injecting elixir expressions into the CSS declarations using `s-bind()`, allowing users to apply
    dynamic values to CSS properties based on the components' assigns. One great thing about this approach
    is that it keeps the CSS syntax valid so it doesn't interfere with tools that depend on valid CSS syntax
    like editor highlighters, linters, etc.
  * Zero configuration in `app.css` or any other file when importing new components, including
    components from dependencies. The compiler will automatically collect and process all component-related
    styles seamlessly.

For more info on the topic, see the [Scoped CSS](/scoped_css) page.

## New context API

The context API has been extended and fully redesigned to improve ergonomics and make it more friendly
for diff tracking. The compiler is able now to detect many cases where the use of contexts might impact
performance and suggest one or more alternative approaches to achieve the same goal.

Along with the optimizations, we introduced a set of functions that allows users to manipulate the
context inside lifecycle callbacks (Liveview and LiveComponent) or in `render/1` (function components).
The main functions introduced are `Context.put/3` and `Context.get/3`, which can also be used with the new
`context_from` option in `prop` or `data` declarations.

### Example

Storing the value in the context (parent Liveview):

```elixir
def mount(_params, _session, socket) do
  socket = Context.put(socket, timezone: "UTC")
  {:ok, socket}
end
```

Retrieving the value from the context (in any component down the tree):

```elixir
data timezone, :string, from_context: :timezone

def render(assigns) do
  ~F"""
  <h1>Timezone: {@timezone}<h1>
  """
end
```

For more info on the topic, see the [Contexts](/contexts) page.

## New `render_sface/1` function

One limitation of using colocated `.sface` files was that there was no easy way to
override `render/1` to (re)calculate assigns values to be used in the template.
With `render_sface/1` you can now safely implement `render/1`, do your calculation and keep
the external file.

### Example

```elixir
def render(assigns) do
  assigns = assign(assigns, full_name: "#{assigns.last_name}, #{assigns.first_name}")
  # Render the colocated .sface template with the given updated
  # assigns so it can render `@full_name` properly.
  render_sface(assigns)
end
```

## New `--layouts` option for `mix surface.init`

One common request from Surface users was that they wanted to use Surface syntax everywhere,
including in layouts. Although that's been possible for a while, the user needed to configure
the project manually to achieve that. With the new `--layouts` option, you can bootstrap your
project replacing the generated default `.heex` layouts with `.sface` files.

## New `--tailwind` option for `mix surface.init`

According to discussions on the issue tracker and Slack, it seems most Surface users are also using
TailwindCSS, including most of the core team members, so to make our lives easier, we decided to
add a `--tailwind` option to `mix surface.init` that allows users to bootstrap projects fully
configured and ready to build and run the project using tailwind's standalone CLI. Notice that
when used together with the `--catalogue`, `--demo` and `--layouts` options, all the related
artefacts generated will also be styled using Tailwind CSS instead of Milligram.

## New `catalogue_test` macro

One common issue when using the Surface Catalogue is that your examples and playgrounds might get
easily out-of-sync with the related component due to continuous changes in its API. With the new
`catalogue_test` macro, you can now generate basic tests for all your examples and playgrounds
with ease, minimizing the chances of facing this kind of issue.

### Example

```elixir
defmodule MyProject.Components.ButtonTest do
  use MyProject.ConnCase, async: true

  catalogue_test MyProject.Components.Button

  # Your other tests for <Button> here
  ...
end
```

In the example above, the macro will automatically generate tests for all examples/playgrounds
found for `MyProject.Components.Button`.

> **Note:** the generated catalogue tests should not be considered a replacement for all
> kinds of tests. Their main goal, as already mentioned, is to keep the examples and playgrounds
> in sync with the component's latest changes. More complex logic and interaction should
> be covered with more appropriate specific tests as usual.

## Enhanced catalogue example API

We improve the Catalogue's API by adding a new module called `Surface.Catalogue.Examples`, which
allows users to create multiple examples as function components per module. Before this addition,
users needed to create one module per example using `Surface.Catalogue.Example`.

Another important change in the API is that we introduced a `@example` module attribute that
also accepts a set of options to customize each example.

### Example

```elixir
defmodule MyProject.Components.Button.Examples do
  use Surface.Catalogue.Examples,
    subject: MyProject.Components.Button,
    title: "Examples for <Button/>"

  @example "The color property"
  def color_example(assigns) do
    ~F"""
    <Button color="info">Info</Button>
    <Button color="warning">Warning</Button>
    <Button color="danger">Danger</Button>
    """
  end

  @example [
    title: "The size property",
    assert: ["small", "medium", "large"]
  ]
  def size_example(assigns) do
    ~F"""
    <Button size="small">Small</Button>
    <Button size="medium">Medium</Button>
    <Button size="large">Large</Button>
    """
  end
end
```

The `assert` option, for instance, will instruct `catalogue_test` to generate extra
assertions to check if the texts passed are present in the generated HTML.

## Wrapping up

Along with the features above, we shipped other important updates, like the new Slot API,
as well as many enhancements to improve both, ergonomics and performance. So make sure you take a
look at the full [changelog](https://github.com/surface-ui/surface/blob/main/CHANGELOG.md#v080-2022-09-01) and feel
free to report any issue you might find. You can also reach out on our
[#surface](https://elixir-slackin.herokuapp.com/) channel on Slack.

For the next version, we'll keep working on extracting parts of the codebase and replacing them with
new LV's native counterparts that have been introduced in the past few months. The goal is to reduce
friction between Surface and LV components until we make them fully compatible in the next
Surface `v0.9` version, which will use the upcoming LV's declarative API for components.

Happy coding!

-marlus