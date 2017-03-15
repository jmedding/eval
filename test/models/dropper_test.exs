defmodule Eval.DropperTest do
  use Eval.ModelCase

  alias Eval.Dropper

  @valid_attrs %{description: "some content", diameter: "some content", length: "some content", manufacturer: "some content", partNo: "some content", price: "120.5", reliability: "120.5", weight: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dropper.changeset(%Dropper{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dropper.changeset(%Dropper{}, @invalid_attrs)
    refute changeset.valid?
  end
end
