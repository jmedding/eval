defmodule Eval.ReviewTest do
  use Eval.ModelCase

  alias Eval.Review

  @valid_attrs %{dropper_id: 2, logo_url: "some content", published_on: %{day: 17, month: 4, year: 2010}, publisher: "some content", publisher_weight: "120.5", rating: 42, reliability: "120.5", review_url: "some content", summary: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end
