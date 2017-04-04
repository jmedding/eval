defmodule Eval.ApiControllerTest do
	use Eval.ConnCase

	alias Eval.ApiView

# DROPPER API TESTS

	test "index renders a list of droppers" do
		conn = build_conn()
		instance = insert(:instance)

		conn = get conn, api_path(conn, :index)

		assert json_response(conn, 200) == render_json(ApiView, "index.json", instances: [instance])
	end

	test "show renders a single dropper" do
		conn = build_conn()
		instance = insert(:instance)

		conn = get conn, api_path(conn, :show, instance)

		assert json_response(conn, 200) == render_json(ApiView, "show.json", instance: instance)
	end

end