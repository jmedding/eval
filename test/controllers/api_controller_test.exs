defmodule Eval.ApiControllerTest do
	use Eval.ConnCase
	alias Eval.ProductView
	alias Eval.ApiView

# DROPPER API TESTS

	test "index renders a list of droppers" do
		conn = build_conn()
		dropper = insert(:dropper)

		conn = get conn, api_path(conn, :index)

		assert json_response(conn, 200) == render_json(ApiView, "index.json", droppers: [dropper])
	end

	test "show renders a single dropper" do
		conn = build_conn()
		dropper = insert(:dropper)

		conn = get conn, api_path(conn, :show, dropper)

		assert json_response(conn, 200) == render_json(ApiView, "show.json", dropper: dropper)
	end

end