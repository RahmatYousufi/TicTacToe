defmodule ServerWeb.ScoreControllerTest do
  use ServerWeb.ConnCase

  import Server.TicTacToeFixtures

  alias Server.TicTacToe.Score

  @create_attrs %{
    O: 42,
    X: 42
  }
  @update_attrs %{
    O: 43,
    X: 43
  }
  @invalid_attrs %{O: nil, X: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all scores", %{conn: conn} do
      conn = get(conn, Routes.score_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create score" do
    test "renders score when data is valid", %{conn: conn} do
      conn = post(conn, Routes.score_path(conn, :create), score: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.score_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "O" => 42,
               "X" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.score_path(conn, :create), score: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update score" do
    setup [:create_score]

    test "renders score when data is valid", %{conn: conn, score: %Score{id: id} = score} do
      conn = put(conn, Routes.score_path(conn, :update, score), score: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.score_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "O" => 43,
               "X" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, score: score} do
      conn = put(conn, Routes.score_path(conn, :update, score), score: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete score" do
    setup [:create_score]

    test "deletes chosen score", %{conn: conn, score: score} do
      conn = delete(conn, Routes.score_path(conn, :delete, score))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.score_path(conn, :show, score))
      end
    end
  end

  defp create_score(_) do
    score = score_fixture()
    %{score: score}
  end
end
