defmodule Eval.ProductView do
	use Eval.Web, :view

	def render("index.json", %{products: products}) do
		%{
			products: Enum.map(products, &product_json/1)
		}
	end

	def render("show.json", %{product: product}) do
		%{
			product: product_json(product)
		}
	end

	def product_json(product) do
		%{
			manufacturer: product.manufacturer,
			partNo: product.partNo,
			description: product.description,
			diameter: product.diameter,
			length: product.length,
			price: product.price,
			reliability: product.reliability,
			inserted_at: product.inserted_at,
			updated_at: product.updated_at
		}
	end
end