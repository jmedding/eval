defmodule Eval.Dropper do
  use Eval.Web, :model

  schema "droppers" do
    field :manufacturer, :string
    field :partNo, :string
    field :description, :string
    field :diameter, :string
    field :length, :string
    field :price, :float
    field :reliability, :float
    field :weight, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:manufacturer, :partNo, :description, :diameter, :length, :price, :reliability, :weight])
    |> validate_required([:manufacturer, :partNo, :description, :diameter, :length, :price, :reliability, :weight])
  end
end
