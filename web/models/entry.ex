defmodule Macrocounter.Entry do
  use Macrocounter.Web, :model

  schema "entries" do
    belongs_to :user, User

    field :name, :string
    field :quantity, :float
    field :unit, :string
    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :quantity, :unit, :grams_protein, :grams_fat, :grams_carbs, :user_id])
    |> validate_required([:grams_protein, :grams_carbs, :grams_fat, :user_id])
  end
end
