defmodule Macrocounter.Food do
  use Macrocounter.Web, :model

  schema "foods" do
    field :name, :string
    field :quantity, :float
    field :unit, :string
    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :quantity, :unit, :grams_protein, :grams_fat, :grams_carbs])
    |> validate_required([:name])
  end
end
