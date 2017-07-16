defmodule Macrocounter.GoalControllerTest do
  use Macrocounter.ConnCase

  alias Macrocounter.Goal
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, goal_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    goal = Repo.insert! %Goal{}
    conn = get conn, goal_path(conn, :show, goal)
    assert json_response(conn, 200)["data"] == %{"id" => goal.id,
      "name" => goal.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, goal_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, goal_path(conn, :create), goal: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Goal, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, goal_path(conn, :create), goal: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    goal = Repo.insert! %Goal{}
    conn = put conn, goal_path(conn, :update, goal), goal: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Goal, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    goal = Repo.insert! %Goal{}
    conn = put conn, goal_path(conn, :update, goal), goal: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    goal = Repo.insert! %Goal{}
    conn = delete conn, goal_path(conn, :delete, goal)
    assert response(conn, 204)
    refute Repo.get(Goal, goal.id)
  end
end
