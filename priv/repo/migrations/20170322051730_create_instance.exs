defmodule Eval.Repo.Migrations.CreateInstance do
  use Ecto.Migration

  def change do
    create table(:instances) do
      add :partNo, :string
      add :diameter, :string
      add :length, :string
      add :price, :float
      add :weight, :float
      add :remark, :string
      add :dropper_id, references(:droppers, on_delete: :nothing)

      timestamps()
    end
    create index(:instances, [:dropper_id])

  end
end
