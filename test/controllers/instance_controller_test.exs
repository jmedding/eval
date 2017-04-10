defmodule Eval.InstanceControllerTest do
  use Eval.ConnCase
  import Eval.Factory

  alias Eval.Instance
  @valid_attrs %{diameter: "some content", length: "some content", partNo: "some content", price: "120.5", weight: "120.5", remark: "special"}
  @invalid_attrs %{diameter: nil}


  test "renders form for new resources" do
    conn = build_conn()
    dropper = insert(:dropper)
    conn = get conn, dropper_instance_path(conn, :new, dropper.id)
    assert html_response(conn, 200) =~ "New instance"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    dropper = insert(:dropper)
    
    conn = post conn, dropper_instance_path(conn, :create, dropper.id), instance: @valid_attrs
    assert redirected_to(conn) == dropper_path(conn, :show, dropper.id)
    assert Repo.get_by(Instance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    dropper = insert(:dropper)

    conn = post conn, dropper_instance_path(conn, :create, dropper.id), instance: @invalid_attrs
    assert html_response(conn, 200) =~ "New instance"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    dropper = insert(:dropper)

    assert_error_sent 404, fn ->
      get conn, dropper_instance_path(conn, :show, dropper.id, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    instance = insert(:instance)
    conn = get conn, dropper_instance_path(conn, :edit, instance.dropper_id, instance)
    assert html_response(conn, 200) =~ "Edit instance"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    instance = insert(:instance)
    conn = put conn, dropper_instance_path(conn, :update, instance.dropper_id, instance), instance: @valid_attrs
    assert redirected_to(conn) == dropper_instance_path(conn, :show, instance.dropper_id, instance)
    assert Repo.get_by(Instance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    instance = insert(:instance)
    conn = put conn, dropper_instance_path(conn, :update, instance.dropper_id, instance), instance: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit instance"
  end

  test "deletes chosen resource", %{conn: conn} do
    instance = insert(:instance)
    conn = delete conn, dropper_instance_path(conn, :delete, instance.dropper_id, instance)
    assert redirected_to(conn) == dropper_path(conn, :show, instance.dropper_id)
    refute Repo.get(Instance, instance.id)
  end
end
