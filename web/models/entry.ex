defmodule Macrocounter.Entry do
  use Macrocounter.Web, :model

  schema "entries" do
    field :name, :string
    field :quantity, :float
    field :unit, :string
    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :quantity, :unit, :grams_protein, :grams_fat, :grams_carbs])
    |> validate_required([:name])
  end
end
