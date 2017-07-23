# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Macrocounter.Repo.insert!(%Macrocounter.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Macrocounter.{Repo, User, Entry, Food, Goal}

user = User.changeset(%{name: "Summer"})
|> Repo.insert!

Entry.changeset(%{
  name: "Fage Yogurt 0%",
  user_id: user.id,
  grams_protein: 23,
  quantity: 227,
  unit: "grams",
  grams_fat: 0,
  grams_carbs: 9
})
|> Repo.insert!

Food.changeset(%{
  name: "Fage Yogurt 0%",
  grams_protein: 23,
  quantity: 227,
  unit: "grams",
  grams_fat: 0,
  grams_carbs: 9
})
|> Repo.insert!

Goal.changeset(%{
  user_id: user.id,
  grams_protein: 110,
  grams_carbs: 107,
  grams_fat: 53
})
|> Repo.insert!

