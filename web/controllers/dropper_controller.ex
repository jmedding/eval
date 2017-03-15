defmodule Eval.DropperController do
  use Eval.Web, :controller

  alias Eval.Dropper

  def index(conn, _params) do
    droppers = Repo.all(Dropper)
    render(conn, "index.html", droppers: droppers)
  end

  def new(conn, _params) do
    changeset = Dropper.changeset(%Dropper{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dropper" => dropper_params}) do
    changeset = Dropper.changeset(%Dropper{}, dropper_params)

    case Repo.insert(changeset) do
      {:ok, _dropper} ->
        conn
        |> put_flash(:info, "Dropper created successfully.")
        |> redirect(to: dropper_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dropper = Repo.get!(Dropper, id)
    render(conn, "show.html", dropper: dropper)
  end

  def edit(conn, %{"id" => id}) do
    dropper = Repo.get!(Dropper, id)
    changeset = Dropper.changeset(dropper)
    render(conn, "edit.html", dropper: dropper, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dropper" => dropper_params}) do
    dropper = Repo.get!(Dropper, id)
    changeset = Dropper.changeset(dropper, dropper_params)

    case Repo.update(changeset) do
      {:ok, dropper} ->
        conn
        |> put_flash(:info, "Dropper updated successfully.")
        |> redirect(to: dropper_path(conn, :show, dropper))
      {:error, changeset} ->
        render(conn, "edit.html", dropper: dropper, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dropper = Repo.get!(Dropper, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dropper)

    conn
    |> put_flash(:info, "Dropper deleted successfully.")
    |> redirect(to: dropper_path(conn, :index))
  end
end
