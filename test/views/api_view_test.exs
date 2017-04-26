defmodule Eval.ApiViewTest do
	use Eval.ModelCase
	import Eval.Factory
	alias Eval.ApiView

	test "api_json" do
		instance = insert(:instance)

		rendered_instance = ApiView.instance_json(instance)

		assert rendered_instance == %{
			brand: instance.dropper.brand,
			partNo: instance.partNo,
			model: instance.dropper.model,
			diameter: instance.diameter,
			length: instance.length,
			price: instance.price,
			weight: instance.weight,
			reliability: instance.dropper.reliability,
			internal: instance.dropper.internal,
			actuator: instance.dropper.actuator,
			inserted_at: instance.inserted_at,
			updated_at: instance.updated_at
		}
	end

	test "index.json" do
		instance = insert(:instance)

		rendered_instances = ApiView.render("index.json", %{instances: [instance]})
		assert rendered_instances == %{
			droppers: [ApiView.instance_json(instance)]
		}
	end

	test "show.json" do
		instance = insert(:instance)
		rendered_instance = ApiView.render("show.json", %{instance: instance})
		assert rendered_instance == %{
			dropper: ApiView.instance_json(instance)
		}
	end
end