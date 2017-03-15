defmodule Eval.ApiView do
  use Eval.Web, :view

  def render("index.json", %{droppers: droppers}) do
		%{
			droppers: Enum.map(droppers, &dropper_json/1)
		}
	end

	def render("show.json", %{dropper: dropper}) do
		%{
			dropper: dropper_json(dropper)
		}
	end

	def dropper_json(dropper) do
		%{
			manufacturer: dropper.manufacturer,
			partNo: dropper.partNo,
			description: dropper.description,
			diameter: dropper.diameter,
			length: dropper.length,
			weight: dropper.weight,
			price: dropper.price,
			reliability: dropper.reliability,
			inserted_at: dropper.inserted_at,
			updated_at: dropper.updated_at
		}
	end
end
