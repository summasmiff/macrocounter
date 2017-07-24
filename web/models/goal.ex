defmodule Macrocounter.Goal do
  use Macrocounter.Web, :model

  schema "goals" do
    belongs_to :user, User

    field :grams_protein, :integer
    field :grams_fat, :integer
    field :grams_carbs, :integer
    field :grams_fiber, :integer

    timestamps()
  end

  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:grams_protein, :grams_fat, :grams_carbs, :grams_fiber,
                     :user_id])
    |> validate_required([:user_id])
  end
end
