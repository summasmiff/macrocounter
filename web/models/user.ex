defmodule Macrocounter.User do
  use Macrocounter.Web, :model

  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(params), do: changeset(%__MODULE__{}, params)
  def changeset(model, params) do
    model
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
