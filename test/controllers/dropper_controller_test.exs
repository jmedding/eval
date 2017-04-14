defmodule Eval.DropperControllerTest do
  use Eval.ConnCase

  alias Eval.Dropper
  @valid_attrs %{brand: "some content", from: %{day: 17, month: 4, year: 2010}, manUrl: "some content", internal: true, actuator: "cable", model: "some content", reliability: "120.5", to: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dropper_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing droppers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dropper_path(conn, :new)
    assert html_response(conn, 200) =~ "New dropper"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dropper_path(conn, :create), dropper: @valid_attrs
    assert redirected_to(conn) == dropper_path(conn, :index)
    assert Repo.get_by(Dropper, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dropper_path(conn, :create), dropper: @invalid_attrs
    assert html_response(conn, 200) =~ "New dropper"
  end

  test "shows chosen resource", %{conn: conn} do
    dropper = insert :dropper
    conn = get conn, dropper_path(conn, :show, dropper)
    assert html_response(conn, 200) =~ "AwesomeDropper5"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dropper_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dropper = Repo.insert! %Dropper{}
    conn = get conn, dropper_path(conn, :edit, dropper)
    assert html_response(conn, 200) =~ "Edit dropper"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dropper = Repo.insert! %Dropper{}
    conn = put conn, dropper_path(conn, :update, dropper), dropper: @valid_attrs
    assert redirected_to(conn) == dropper_path(conn, :show, dropper)
    assert Repo.get_by(Dropper, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dropper = Repo.insert! %Dropper{}
    conn = put conn, dropper_path(conn, :update, dropper), dropper: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dropper"
  end

  test "deletes chosen resource", %{conn: conn} do
    dropper = Repo.insert! %Dropper{}
    conn = delete conn, dropper_path(conn, :delete, dropper)
    assert redirected_to(conn) == dropper_path(conn, :index)
    refute Repo.get(Dropper, dropper.id)
  end
end
