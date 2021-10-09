defmodule Server.TicTacToeTest do
  use Server.DataCase

  alias Server.TicTacToe

  describe "squares" do
    alias Server.TicTacToe.Square

    import Server.TicTacToeFixtures

    @invalid_attrs %{square_eight: nil, square_five: nil, square_four: nil, square_one: nil, square_seven: nil, square_six: nil, square_three: nil, square_two: nil, square_zero: nil}

    test "list_squares/0 returns all squares" do
      square = square_fixture()
      assert TicTacToe.list_squares() == [square]
    end

    test "get_square!/1 returns the square with given id" do
      square = square_fixture()
      assert TicTacToe.get_square!(square.id) == square
    end

    test "create_square/1 with valid data creates a square" do
      valid_attrs = %{square_eight: "some square_eight", square_five: "some square_five", square_four: "some square_four", square_one: "some square_one", square_seven: "some square_seven", square_six: "some square_six", square_three: "some square_three", square_two: "some square_two", square_zero: "some square_zero"}

      assert {:ok, %Square{} = square} = TicTacToe.create_square(valid_attrs)
      assert square.square_eight == "some square_eight"
      assert square.square_five == "some square_five"
      assert square.square_four == "some square_four"
      assert square.square_one == "some square_one"
      assert square.square_seven == "some square_seven"
      assert square.square_six == "some square_six"
      assert square.square_three == "some square_three"
      assert square.square_two == "some square_two"
      assert square.square_zero == "some square_zero"
    end

    test "create_square/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TicTacToe.create_square(@invalid_attrs)
    end

    test "update_square/2 with valid data updates the square" do
      square = square_fixture()
      update_attrs = %{square_eight: "some updated square_eight", square_five: "some updated square_five", square_four: "some updated square_four", square_one: "some updated square_one", square_seven: "some updated square_seven", square_six: "some updated square_six", square_three: "some updated square_three", square_two: "some updated square_two", square_zero: "some updated square_zero"}

      assert {:ok, %Square{} = square} = TicTacToe.update_square(square, update_attrs)
      assert square.square_eight == "some updated square_eight"
      assert square.square_five == "some updated square_five"
      assert square.square_four == "some updated square_four"
      assert square.square_one == "some updated square_one"
      assert square.square_seven == "some updated square_seven"
      assert square.square_six == "some updated square_six"
      assert square.square_three == "some updated square_three"
      assert square.square_two == "some updated square_two"
      assert square.square_zero == "some updated square_zero"
    end

    test "update_square/2 with invalid data returns error changeset" do
      square = square_fixture()
      assert {:error, %Ecto.Changeset{}} = TicTacToe.update_square(square, @invalid_attrs)
      assert square == TicTacToe.get_square!(square.id)
    end

    test "delete_square/1 deletes the square" do
      square = square_fixture()
      assert {:ok, %Square{}} = TicTacToe.delete_square(square)
      assert_raise Ecto.NoResultsError, fn -> TicTacToe.get_square!(square.id) end
    end

    test "change_square/1 returns a square changeset" do
      square = square_fixture()
      assert %Ecto.Changeset{} = TicTacToe.change_square(square)
    end
  end

  describe "scores" do
    alias Server.TicTacToe.Score

    import Server.TicTacToeFixtures

    @invalid_attrs %{O: nil, X: nil}

    test "list_scores/0 returns all scores" do
      score = score_fixture()
      assert TicTacToe.list_scores() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert TicTacToe.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      valid_attrs = %{O: 42, X: 42}

      assert {:ok, %Score{} = score} = TicTacToe.create_score(valid_attrs)
      assert score.O == 42
      assert score.X == 42
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TicTacToe.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      update_attrs = %{O: 43, X: 43}

      assert {:ok, %Score{} = score} = TicTacToe.update_score(score, update_attrs)
      assert score.O == 43
      assert score.X == 43
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = TicTacToe.update_score(score, @invalid_attrs)
      assert score == TicTacToe.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = TicTacToe.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> TicTacToe.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = TicTacToe.change_score(score)
    end
  end
end
