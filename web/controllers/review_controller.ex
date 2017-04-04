defmodule Eval.ReviewController do
  use Eval.Web, :controller

  alias Eval.Review

  def new(conn, %{"dropper_id" => dropper_id}) do
    changeset = Review.changeset(%Review{})
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"dropper_id" => dropper_id, "review" => review_params}) do
    review_params = Map.merge(review_params, %{"dropper_id" => dropper_id})
    changeset = Review.changeset(%Review{}, review_params)
    conn = assign(conn, :dropper_id, dropper_id)
    
    case Repo.insert(changeset) do
      {:ok, _review} ->
        conn
        |> put_flash(:info, "Review created successfully.")
        |> redirect(to: dropper_path(conn, :show, dropper_id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"dropper_id" => dropper_id, "id" => id}) do
    review = Repo.get!(Review, id)
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("show.html", review: review)
  end

  def edit(conn, %{"dropper_id" => dropper_id, "id" => id}) do
    review = Repo.get!(Review, id)
    changeset = Review.changeset(review)
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("edit.html", review: review, changeset: changeset)
  end

  def update(conn, %{"dropper_id" => dropper_id, "id" => id, "review" => review_params}) do
    review = Repo.get!(Review, id)
    changeset = Review.changeset(review, review_params)

    conn = assign(conn, :dropper_id, dropper_id)
    case Repo.update(changeset) do
      {:ok, review} ->
        conn
        |> put_flash(:info, "Review updated successfully.")
        |> redirect(to: dropper_path(conn, :show, dropper_id))
      {:error, changeset} ->
        render(conn, "edit.html", review: review, changeset: changeset)
    end
  end

  def delete(conn, %{"dropper_id" => dropper_id, "id" => id}) do
    review = Repo.get!(Review, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(review)

    conn
    |> put_flash(:info, "Review deleted successfully.")
    |> redirect(to: dropper_path(conn, :show, dropper_id))
  end
end
