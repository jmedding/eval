defmodule Eval.Repo.Migrations.CreateDropper do
  use Ecto.Migration

  def change do
    create table(:droppers) do
      add :brand, :string
      add :model, :string
      add :manUrl, :string
      add :from, :date
      add :to, :date
      add :reliability, :float

      timestamps()
    end

  end
end
