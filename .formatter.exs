[
  import_deps: [:phoenix, :surface, :ecto],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  surface_inputs: ["{lib,test}/**/*.{ex,exs,sface}"],
  subdirectories: []
]
