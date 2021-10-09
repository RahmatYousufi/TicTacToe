defmodule Server.TicTacToeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Server.TicTacToe` context.
  """

  @doc """
  Generate a square.
  """
  def square_fixture(attrs \\ %{}) do
    {:ok, square} =
      attrs
      |> Enum.into(%{
        square_eight: "some square_eight",
        square_five: "some square_five",
        square_four: "some square_four",
        square_one: "some square_one",
        square_seven: "some square_seven",
        square_six: "some square_six",
        square_three: "some square_three",
        square_two: "some square_two",
        square_zero: "some square_zero"
      })
      |> Server.TicTacToe.create_square()

    square
  end

  @doc """
  Generate a score.
  """
  def score_fixture(attrs \\ %{}) do
    {:ok, score} =
      attrs
      |> Enum.into(%{
        O: 42,
        X: 42
      })
      |> Server.TicTacToe.create_score()

    score
  end
end
