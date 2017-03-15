defmodule Eval.Product do
	use Eval.Web, :model

	schema "products" do
		field :manufacturer
		field :partNo
		field :description
		field :diameter
		field :length
		field :price, :float
		field :reliability, :float

		timestamps
	end
end