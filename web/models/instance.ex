defmodule Eval.Instance do
  use Eval.Web, :model

  schema "instances" do
    field :partNo, :string
    field :diameter, :string
    field :length, :string
    field :price, :float
    field :weight, :float
    belongs_to :dropper, Eval.Dropper

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:dropper_id, :partNo, :diameter, :length, :price, :weight])
    |> validate_required([:dropper_id, :partNo, :diameter, :length, :price, :weight])
  end
end
