%{
  title: "Surface v0.12 released!",
  author: "Marlus Saraiva",
  tags: ~w(surface releases liveview),
  description: """
  Surface `v0.12` is out! This version introduces some breaking changes as it's mostly a preparation for `v0.13`.
  It also deprecates a few components as their usage is no longer required/recommended.
  """
}
---

Surface `v0.12` is out!

This version introduces some breaking changes as it's mostly a preparation for `v0.13`.
It also deprecates a few components as their usage is no longer required/recommended.

Full changelog can be found [here](https://github.com/surface-ui/surface/blob/main/CHANGELOG.md#v0120-2024-09-24).

Here's a quick overview on the main changes.

## Extracting Form components

The most impactful change is that all form-related components have been moved to
[surface_form_helpers](https://github.com/surface-ui/surface_form_helpers). That includes the `<Form>` component
itself and all other input controls.

The reason those components were created in the first place was to add support
for [scope-aware contexts](https://www.surface-ui.org/contexts#scope-aware-context) to forms. Since this
feature has been deprecated due to the lack of built-in support in Liveview, we strongly recommend using the new
built-in [<.form>](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#form/)
component, along with [Phoenix.HTML.Form](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html) and
[Phoenix.HTML.FormField](https://hexdocs.pm/phoenix_html/Phoenix.HTML.FormField.html) structs. This new Liveview API
is way more efficient regarding diff-tracking and should be the default way to design forms.

If you're not able to update all your forms at once, [surface_form_helpers](https://github.com/surface-ui/surface_form_helpers)
can be used as a safe fallback so you can
gradually replace them. For more information on that, see [Migration Guide - v0.12](https://github.com/surface-ui/surface/blob/main/MIGRATING.md#migrating-to-v012x).

## Deprecations

Components `<LivePatch>`, `<LiveRedirect>` and `<Link>` have been deprecated in favor of `<.link>`. Replacing those
components should be straitforward. In most cases all you have to do is to replace:

* `<LiveRedirect to="...">` with `<.link navigate="...">`
* `<LivePatch to="...">` with `<.link patch="...">`
* `<Link to="...">` with `<.link href="...">`

For more info on `<.link>`, see the official [Live Navigation](https://hexdocs.pm/phoenix_live_view/live-navigation.html) docs.

### Scope-aware Contexts

Another component that has been deprecated is `<Context>`, which used to be used to allow
Scope-aware contexts.

This feature has been deprecated and will be removed in `v0.13` due to the lack of built-in
support for the feature in Liveview itself, which leads to inefficient diff-tracking when using it.

Global context related functions like `Context.put/3` and `Context.get/3`, as well as data/prop's
option `:from_context`, will be kept and recommended as their usage don't affect diff-tracking
negatively.

Happy coding!

-marlus