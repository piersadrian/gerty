defmodule HALWeb.StatsControllerTest do
  use HALWeb.ConnCase

  alias HAL.IO
  alias HAL.IO.Stats

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:stats) do
    {:ok, stats} = IO.create_stats(@create_attrs)
    stats
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stats", %{conn: conn} do
      conn = get conn, stats_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stats" do
    test "renders stats when data is valid", %{conn: conn} do
      conn = post conn, stats_path(conn, :create), stats: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, stats_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, stats_path(conn, :create), stats: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stats" do
    setup [:create_stats]

    test "renders stats when data is valid", %{conn: conn, stats: %Stats{id: id} = stats} do
      conn = put conn, stats_path(conn, :update, stats), stats: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, stats_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, stats: stats} do
      conn = put conn, stats_path(conn, :update, stats), stats: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stats" do
    setup [:create_stats]

    test "deletes chosen stats", %{conn: conn, stats: stats} do
      conn = delete conn, stats_path(conn, :delete, stats)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, stats_path(conn, :show, stats)
      end
    end
  end

  defp create_stats(_) do
    stats = fixture(:stats)
    {:ok, stats: stats}
  end
end
