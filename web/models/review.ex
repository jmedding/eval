defmodule Eval.Review do
  use Eval.Web, :model

  schema "reviews" do
    field :title, :string
    field :publisher, :string
    field :review_url, :string
    field :logo_url, :string
    field :reliability, :float
    field :publisher_weight, :float
    field :summary, :string
    field :published_on, Ecto.Date
    field :rating, :integer
    belongs_to :dropper, Eval.Dropper

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :publisher, :review_url, :logo_url, :reliability, :publisher_weight, :summary, :published_on, :rating, :dropper_id])
    |> validate_required([:title, :publisher, :review_url, :reliability, :publisher_weight, :published_on, :rating, :dropper_id])
  end
end
