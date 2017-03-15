defmodule Eval.ApiController do
	use Eval.Web, :controller

	alias Eval.Dropper

	def index(conn, _params) do
		droppers = Repo.all(Dropper)
		render conn, "index.json", droppers: droppers
	end

	def show(conn, %{"id" => id}) do
		dropper = Repo.get!(Dropper, id)
		render(conn, "show.json", dropper: dropper)
	end
end