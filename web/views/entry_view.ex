defmodule Macrocounter.EntryView do
  use Macrocounter.Web, :view

  def render("index.json", %{entries: entries}) do
    %{data: render_many(entries, Macrocounter.EntryView, "entry.json")}
  end

  def render("show.json", %{entry: entry}) do
    %{data: render_one(entry, Macrocounter.EntryView, "entry.json")}
  end

  def render("entry.json", %{entry: entry}) do
    %{id: entry.id,
      name: entry.name}
  end
end
