defmodule Eval.InstanceTest do
  use Eval.ModelCase

  alias Eval.Instance

  @valid_attrs %{dropper_id: 2, diameter: "some content", length: "some content", partNo: "some content", price: "120.5", weight: "120.5", remark: "Special"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Instance.changeset(%Instance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Instance.changeset(%Instance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
