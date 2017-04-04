defmodule Eval.Dropper do
  use Eval.Web, :model

  schema "droppers" do
    field :brand, :string
    field :model, :string
    field :manUrl, :string
    field :from, Ecto.Date
    field :to, Ecto.Date
    field :reliability, :float

    has_many :instances, Eval.Instance
    has_many :reviews, Eval.Review

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:brand, :model, :manUrl, :from, :to, :reliability])
    |> validate_required([:brand, :model, :manUrl, :from, :to, :reliability])
  end
end
