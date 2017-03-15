defmodule Eval.ProductViewTest do
	use Eval.ModelCase
	import Eval.Factory
	alias Eval.ProductView

	test "product_json" do
		product = insert(:product)

		rendered_product = ProductView.product_json(product)

		assert rendered_product == %{
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

	test "index.json" do
		product = insert(:product)

		rendered_products = ProductView.render("index.json", %{products: [product]})
		assert rendered_products == %{
			products: [ProductView.product_json(product)]
		}
	end

	test "show.json" do
		product = insert(:product)
		rendered_product = ProductView.render("show.json", %{product: product})
		assert rendered_product == %{
			product: ProductView.product_json(product)
		}
	end
end