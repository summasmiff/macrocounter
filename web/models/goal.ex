defmodule Macrocounter.Goal do
  use Macrocounter.Web, :model

  schema "goals" do
    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:grams_protein, :grams_fat, :grams_carbs])
  end
end
