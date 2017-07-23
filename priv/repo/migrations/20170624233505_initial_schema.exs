defmodule Macrocounter.Repo.Migrations.InitialSchema do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string

      timestamps()
    end

    create table(:foods) do
      add :name, :string
      add :quantity, :float
      add :unit, :string
      add :grams_protein, :integer
      add :grams_fat, :integer
      add :grams_carbs, :integer

      timestamps()
    end

    create table(:entries) do
      add :name, :string
      add :quantity, :float
      add :unit, :string
      add :grams_protein, :integer
      add :grams_fat, :integer
      add :grams_carbs, :integer
      add :user_id, references(:users)
      add :food_id, references(:foods)

      timestamps()
    end

    create table(:goals) do
      add :grams_protein, :integer
      add :grams_fat, :integer
      add :grams_carbs, :integer
      add :user_id, references(:users)

      timestamps()
    end
  end
end
