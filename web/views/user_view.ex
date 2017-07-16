defmodule Macrocounter.UserView do
  use Macrocounter.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Macrocounter.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Macrocounter.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name}
  end
end
