defmodule Eval.Repo.Migrations.CreateDropper do
  use Ecto.Migration

  def change do
    create table(:droppers) do
      add :manufacturer, :string
      add :partNo, :string
      add :description, :string
      add :diameter, :string
      add :length, :string
      add :price, :float
      add :reliability, :float
      add :weight, :float

      timestamps()
    end

  end
end
