defmodule Eval.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
  	create table(:products) do
  		add :manufacturer, :string
  		add :partNo, :string
  		add :description, :string
  		add :diameter, :string
  		add :length, :string
  		add :price, :float, default: 0.0
  		add :reliability, :float, default: 5.0

  		timestamps
  	end
  end
end
