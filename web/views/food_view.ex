defmodule Macrocounter.FoodView do
  use Macrocounter.Web, :view

  def render("index.json", %{foods: foods}) do
    %{data: render_many(foods, Macrocounter.FoodView, "food.json")}
  end

  def render("show.json", %{food: food}) do
    %{data: render_one(food, Macrocounter.FoodView, "food.json")}
  end

  def render("food.json", %{food: food}) do
    %{id: food.id,
      name: food.name}
  end
end
