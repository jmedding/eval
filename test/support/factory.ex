defmodule Eval.Factory do
	use ExMachina.Ecto, repo: Eval.Repo

	def product_factory do
		%Eval.Product{
			manufacturer: "Brand",
			partNo: "abc123",
			description: "AwesomeDropper5",
			diameter: "30.9",
			length: "125mm",
			price: 444.0,
			reliability: 5.0
		}
	end

	def dropper_factory do
		%Eval.Dropper{
			manufacturer: "Brand",
			partNo: "abc123",
			description: "AwesomeDropper5",
			diameter: "30.9",
			length: "125mm",
			weight: 420.2,
			price: 444.0,
			reliability: 5.0
		}
	end
end