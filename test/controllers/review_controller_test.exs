defmodule Eval.ReviewControllerTest do
  use Eval.ConnCase

  alias Eval.Review
  @valid_attrs %{logo_url: "logo_url.com/logo", published_on: %{day: 17, month: 4, year: 2010}, publisher: "Happy Publisher", publisher_weight: "7.0", rating: 3, reliability: "7.0", review_url: "url.com/review", summary: "a great summary", title: "Wonderful title"}
  @invalid_attrs %{dropper_id: nil}

  test "renders form for new resources", %{conn: conn} do
    dropper = insert(:dropper)
    conn = get conn, dropper_review_path(conn, :new, dropper.id)    
    assert html_response(conn, 200) =~ "New review"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    dropper = insert(:dropper)

    conn = post conn, dropper_review_path(conn, :create, dropper.id), review: @valid_attrs
    assert redirected_to(conn) == dropper_path(conn, :show, dropper.id)
    assert Repo.get_by(Review, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    dropper = insert(:dropper)
    conn = post conn, dropper_review_path(conn, :create, dropper.id), review: @invalid_attrs
    assert html_response(conn, 200) =~ "New review"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    dropper = insert(:dropper)
    assert_error_sent 404, fn ->
      get conn, dropper_review_path(conn, :edit, dropper.id, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    review = insert :review
    conn = get conn, dropper_review_path(conn, :edit, review.dropper_id, review)
    assert html_response(conn, 200) =~ "Edit review"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    review = insert :review
    conn = put conn, dropper_review_path(conn, :update, review.dropper_id, review), review: @valid_attrs
    assert redirected_to(conn) == dropper_path(conn, :show, review.dropper_id)
    assert Repo.get_by(Review, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    review = insert :review
    conn = put conn, dropper_review_path(conn, :update,review.dropper_id, review), review: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit review"
  end

  test "deletes chosen resource", %{conn: conn} do
    review = insert :review
    conn = delete conn, dropper_review_path(conn, :delete, review.dropper_id, review)
    assert redirected_to(conn) == dropper_path(conn, :show, review.dropper_id)
    refute Repo.get(Review, review.id)
  end
end
