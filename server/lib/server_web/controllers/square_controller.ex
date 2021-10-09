defmodule ServerWeb.SquareController do
  use ServerWeb, :controller

  alias Server.TicTacToe
  alias Server.TicTacToe.Square

  action_fallback ServerWeb.FallbackController

  def index(conn, _params) do
    squares = TicTacToe.list_squares()
    render(conn, "index.json", squares: squares)
  end

  def create(conn, %{"square" => square_params}) do
    with {:ok, %Square{} = square} <- TicTacToe.create_square(square_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.square_path(conn, :show, square))
      |> render("show.json", square: square)
    end
  end

  def show(conn, %{"id" => id}) do
    square = TicTacToe.get_square!(id)
    render(conn, "show.json", square: square)
  end

  def update(conn, %{"id" => id, "square" => square_params}) do
    square = TicTacToe.get_square!(id)

    #covert to map keys from strings to atoms
    # square_params
    # |> Map.new(fn {k,v} -> {String.to_atom(k), v} end)

    with {:ok, %Square{} = square} <- TicTacToe.update_square(square, Map.new(square_params, fn {k,v} -> {String.to_atom(k), v} end)) do
      render(conn, "show.json", square: square)
    end
  end

  def delete(conn, %{"id" => id}) do
    square = TicTacToe.get_square!(id)

    with {:ok, %Square{}} <- TicTacToe.delete_square(square) do
      send_resp(conn, :no_content, "")
    end
  end
end
