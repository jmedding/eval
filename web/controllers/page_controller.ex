defmodule Eval.PageController do
  use Eval.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
