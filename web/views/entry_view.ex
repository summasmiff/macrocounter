defmodule Macrocounter.EntryView do
  use Macrocounter.Web, :view

  def render("index.json", %{entries: entries}) do
    %{data: render_many(entries, Macrocounter.EntryView, "entry.json")}
  end

  def render("show.json", %{entry: entry}) do
    %{data: render_one(entry, Macrocounter.EntryView, "entry.json")}
  end

  def render("entry.json", %{entry: entry}) do
    %{
      id: entry.id,
      name: entry.name,
      grams_protein: entry.grams_protein,
      grams_carbs: entry.grams_carbs,
      grams_fat: entry.grams_fat,
      grams_fiber: entry.grams_fiber
     }
  end
end
