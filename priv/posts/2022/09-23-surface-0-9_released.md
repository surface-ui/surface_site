%{
  title: "Surface v0.9 released!",
  author: "Marlus Saraiva",
  tags: ~w(surface releases liveview),
  description: """
  Surface `v0.9` is out! This version supports Liveview `v0.18` and all its amazing new features.
  """
}
---

Surface `v0.9` is out! This version supports Liveview `v0.18` and all its amazing new
features.

We also released a `v0.8.3` version for those who won't be able to migrate to LV `v0.18`
immediately but want to keep up-to-date with the latest fixes.

The changelog for both versions can be found [here](https://github.com/surface-ui/surface/blob/main/CHANGELOG.md).

Pay attention that although we haven't introduced any breaking change, you may face compilation
issues due to Phoenix moving some functions around, including a bunch of common functions that
used to be placed in `Phoenix.LiveView.Helpers` but are now in `Phoenix.Component`.

Please make sure you read Liveview's [CHANGELOG](https://github.com/phoenixframework/phoenix_live_view/blob/master/CHANGELOG.md#0180-2022-09-20) as well as the [LiveView 0.18 Released](https://www.phoenixframework.org/blog/phoenix-liveview-0.18-released)
blog post for further information regarding new features and deprecations.

Happy migration!

-marlus