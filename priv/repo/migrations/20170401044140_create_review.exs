defmodule Eval.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :title, :string
      add :publisher, :string
      add :review_url, :string
      add :logo_url, :string
      add :reliability, :float
      add :publisher_weight, :float
      add :summary, :text
      add :published_on, :date
      add :rating, :integer
      add :dropper_id, references(:droppers, on_delete: :nothing)

      timestamps()
    end
    create index(:reviews, [:dropper_id])

  end
end
