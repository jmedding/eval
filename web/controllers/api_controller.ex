defmodule Eval.ApiController do
	use Eval.Web, :controller

	alias Eval.Dropper
	alias Eval.Instance

	def index(conn, _params) do
		instances = Repo.all(Instance) |> Repo.preload([:dropper])
		render conn, "index.json", instances: instances
	end

	def show(conn, %{"id" => id}) do
		instance = Repo.get!(Instance, id) |> Repo.preload([:dropper])
		render(conn, "show.json", instance: instance)
	end
end