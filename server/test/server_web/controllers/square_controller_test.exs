defmodule ServerWeb.SquareControllerTest do
  use ServerWeb.ConnCase

  import Server.TicTacToeFixtures

  alias Server.TicTacToe.Square

  @create_attrs %{
    square_eight: "some square_eight",
    square_five: "some square_five",
    square_four: "some square_four",
    square_one: "some square_one",
    square_seven: "some square_seven",
    square_six: "some square_six",
    square_three: "some square_three",
    square_two: "some square_two",
    square_zero: "some square_zero"
  }
  @update_attrs %{
    square_eight: "some updated square_eight",
    square_five: "some updated square_five",
    square_four: "some updated square_four",
    square_one: "some updated square_one",
    square_seven: "some updated square_seven",
    square_six: "some updated square_six",
    square_three: "some updated square_three",
    square_two: "some updated square_two",
    square_zero: "some updated square_zero"
  }
  @invalid_attrs %{square_eight: nil, square_five: nil, square_four: nil, square_one: nil, square_seven: nil, square_six: nil, square_three: nil, square_two: nil, square_zero: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all squares", %{conn: conn} do
      conn = get(conn, Routes.square_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create square" do
    test "renders square when data is valid", %{conn: conn} do
      conn = post(conn, Routes.square_path(conn, :create), square: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.square_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "square_eight" => "some square_eight",
               "square_five" => "some square_five",
               "square_four" => "some square_four",
               "square_one" => "some square_one",
               "square_seven" => "some square_seven",
               "square_six" => "some square_six",
               "square_three" => "some square_three",
               "square_two" => "some square_two",
               "square_zero" => "some square_zero"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.square_path(conn, :create), square: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update square" do
    setup [:create_square]

    test "renders square when data is valid", %{conn: conn, square: %Square{id: id} = square} do
      conn = put(conn, Routes.square_path(conn, :update, square), square: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.square_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "square_eight" => "some updated square_eight",
               "square_five" => "some updated square_five",
               "square_four" => "some updated square_four",
               "square_one" => "some updated square_one",
               "square_seven" => "some updated square_seven",
               "square_six" => "some updated square_six",
               "square_three" => "some updated square_three",
               "square_two" => "some updated square_two",
               "square_zero" => "some updated square_zero"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, square: square} do
      conn = put(conn, Routes.square_path(conn, :update, square), square: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete square" do
    setup [:create_square]

    test "deletes chosen square", %{conn: conn, square: square} do
      conn = delete(conn, Routes.square_path(conn, :delete, square))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.square_path(conn, :show, square))
      end
    end
  end

  defp create_square(_) do
    square = square_fixture()
    %{square: square}
  end
end
