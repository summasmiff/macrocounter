defmodule Macrocounter.GoalView do
  use Macrocounter.Web, :view

  def render("index.json", %{goals: goals}) do
    %{data: render_many(goals, Macrocounter.GoalView, "goal.json")}
  end

  def render("show.json", %{goal: goal}) do
    %{data: render_one(goal, Macrocounter.GoalView, "goal.json")}
  end

  def render("goal.json", %{goal: goal}) do
    %{id: goal.id,
      name: goal.name}
  end
end
