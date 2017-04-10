defmodule Eval.DropperTest do
  use Eval.ModelCase

  alias Eval.Dropper

  @valid_attrs %{brand: "some content", internal: true, from: %{day: 17, month: 4, year: 2010}, manUrl: "some content", model: "some content", reliability: "120.5", to: %{day: 17, month: 4, year: 2010}}
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
