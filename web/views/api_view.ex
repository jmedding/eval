defmodule Eval.ApiView do
  use Eval.Web, :view

  def render("index.json", %{instances: instances}) do
		%{
			droppers: Enum.map(instances, &instance_json/1)
		}
	end

	def render("show.json", %{instance: instance}) do
		%{
			dropper: instance_json(instance)
		}
	end

	def instance_json(instance) do
		%{
			brand: instance.dropper.brand,
			partNo: instance.partNo,
			model: instance.dropper.model,
			diameter: instance.diameter,
			length: instance.length,
			price: instance.price,
			reliability: instance.dropper.reliability,
			internal: instance.dropper.internal,
			inserted_at: instance.inserted_at,
			updated_at: instance.updated_at
		}
	end
end
