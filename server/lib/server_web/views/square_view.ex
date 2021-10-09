defmodule ServerWeb.SquareView do
  use ServerWeb, :view
  alias ServerWeb.SquareView

  def render("index.json", %{squares: squares}) do
    %{data: render_many(squares, SquareView, "square.json")}
  end

  def render("show.json", %{square: square}) do
    %{data: render_one(square, SquareView, "square.json")}
  end

  def render("square.json", %{square: square}) do
    %{
      id: square.id,
      square_zero: square.square_zero,
      square_one: square.square_one,
      square_two: square.square_two,
      square_three: square.square_three,
      square_four: square.square_four,
      square_five: square.square_five,
      square_six: square.square_six,
      square_seven: square.square_seven,
      square_eight: square.square_eight
    }
  end
end
