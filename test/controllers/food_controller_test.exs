defmodule Macrocounter.FoodControllerTest do
  use Macrocounter.ConnCase

  alias Macrocounter.Food
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, food_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    food = Repo.insert! %Food{}
    conn = get conn, food_path(conn, :show, food)
    assert json_response(conn, 200)["data"] == %{"id" => food.id,
      "name" => food.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, food_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, food_path(conn, :create), food: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Food, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, food_path(conn, :create), food: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    food = Repo.insert! %Food{}
    conn = put conn, food_path(conn, :update, food), food: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Food, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    food = Repo.insert! %Food{}
    conn = put conn, food_path(conn, :update, food), food: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    food = Repo.insert! %Food{}
    conn = delete conn, food_path(conn, :delete, food)
    assert response(conn, 204)
    refute Repo.get(Food, food.id)
  end
end
