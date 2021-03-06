defmodule Macrocounter.Food do
  use Macrocounter.Web, :model

  schema "foods" do
    field :name, :string
    field :quantity, :float
    field :unit, :string
    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer
    field :grams_fiber, :integer

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :quantity, :unit, :grams_protein, :grams_fat,
                     :grams_carbs, :grams_fiber])
    |> validate_required([:name])
  end
end
