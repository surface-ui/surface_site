defmodule SurfaceSite.Blog do

  defmodule NotFoundError, do: defexception [:message, plug_status: 404]

  defmodule Post do
    alias SurfaceSiteWeb.Components.Markdown

    @enforce_keys [:id, :author, :title, :body, :description, :tags, :date]
    defstruct [:id, :author, :title, :body, :description, :tags, :date, :hidden]

    def build(filename, attrs, body) do
      [year, month_day_id] = filename |> Path.rootname() |> Path.split() |> Enum.take(-2)
      [month, day, id] = String.split(month_day_id, "-", parts: 3)
      date = Date.from_iso8601!("#{year}-#{month}-#{day}")
      attrs = Map.update!(attrs, :description, &Markdown.to_html/1)
      struct!(__MODULE__, [id: id, date: date, body: body] ++ Map.to_list(attrs))
    end
  end

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:surface_site, "priv/posts/**/*.md"),
    as: :posts,
    earmark_options: %Earmark.Options{
      smartypants: false,
      code_class_prefix: "language-",
      postprocessor: &SurfaceSiteWeb.Components.Markdown.post_processor/1
    }

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  @visible_posts Enum.filter(@posts, & !&1.hidden)

  @tags @visible_posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  def all_posts, do: @posts

  def visible_posts, do: @visible_posts

  def recent_posts(num) do
    Enum.take(visible_posts(), num)
  end

  def get_post_by_id!(id) do
    Enum.find(all_posts(), &(&1.id == id)) ||
      raise NotFoundError, "post with id=#{id} not found"
  end

  def get_posts_by_tag!(tag) do
    Enum.filter(visible_posts(), &(tag in &1.tags))
  end

  def all_tags, do: @tags
end
