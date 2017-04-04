defmodule Eval.InstanceController do
  use Eval.Web, :controller

  alias Eval.Instance

  def index(conn, %{"dropper_id" => dropper_id}) do
    instances = Repo.all(Instance)
    render(conn, "index.html", instances: instances, dropper_id: dropper_id)
  end

  def new(conn, %{"dropper_id" => dropper_id}) do
    changeset = Instance.changeset(%Instance{})
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"dropper_id" => dropper_id, "instance" => instance_params}) do
    instance_params = Map.merge(instance_params, %{"dropper_id" => dropper_id})
    changeset = Instance.changeset(%Instance{}, instance_params)

    case Repo.insert(changeset) do
      {:ok, _instance} ->
        conn
        |> assign(:dropper_id, dropper_id)
        |> put_flash(:info, "Instance created successfully.")
        |> redirect(to: dropper_path(conn, :show, dropper_id))
      {:error, changeset} ->
        conn
        |> assign(:dropper_id, dropper_id)
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"dropper_id" => dropper_id, "id" => id}) do
    instance = Repo.get!(Instance, id)
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("show.html", instance: instance)
  end

  def edit(conn, %{"dropper_id" => dropper_id, "id" => id}) do
    instance = Repo.get!(Instance, id)
    changeset = Instance.changeset(instance)
    conn
    |> assign(:dropper_id, dropper_id)
    |> render("edit.html", instance: instance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dropper_id" => dropper_id, "instance" => instance_params}) do
    instance = Repo.get!(Instance, id)
    instance_params = Map.merge(instance_params, %{"dropper_id" => dropper_id})
    changeset = Instance.changeset(instance, instance_params)

    case Repo.update(changeset) do
      {:ok, instance} ->
        conn
        |> assign(:dropper_id, dropper_id)
        |> put_flash(:info, "Instance updated successfully.")
        |> redirect(to: dropper_instance_path(conn, :show, dropper_id, instance))
      {:error, changeset} ->
        conn
        |> assign(:dropper_id, dropper_id)
        |> render("edit.html", instance: instance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "dropper_id" => dropper_id}) do
    instance = Repo.get!(Instance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(instance)

    conn
    |> assign(:dropper_id, instance.dropper_id)
    |> put_flash(:info, "Instance deleted successfully.")
    |> redirect(to: dropper_path(conn, :show, dropper_id))
  end
end
