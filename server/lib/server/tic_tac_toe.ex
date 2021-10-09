defmodule Server.TicTacToe do
  @moduledoc """
  The TicTacToe context.
  """

  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.TicTacToe.Square

  @doc """
  Returns the list of squares.

  ## Examples

      iex> list_squares()
      [%Square{}, ...]

  """
  def list_squares do
    Repo.all(Square)
  end

  @doc """
  Gets a single square.

  Raises `Ecto.NoResultsError` if the Square does not exist.

  ## Examples

      iex> get_square!(123)
      %Square{}

      iex> get_square!(456)
      ** (Ecto.NoResultsError)

  """
  def get_square!(id), do: Repo.get!(Square, id)

  @doc """
  Creates a square.

  ## Examples

      iex> create_square(%{field: value})
      {:ok, %Square{}}

      iex> create_square(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_square(attrs \\ %{}) do
    %Square{}
    |> Square.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a square.

  ## Examples

      iex> update_square(square, %{field: new_value})
      {:ok, %Square{}}

      iex> update_square(square, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_square(%Square{} = square, attrs) do
    square
    |> Square.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a square.

  ## Examples

      iex> delete_square(square)
      {:ok, %Square{}}

      iex> delete_square(square)
      {:error, %Ecto.Changeset{}}

  """
  def delete_square(%Square{} = square) do
    Repo.delete(square)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking square changes.

  ## Examples

      iex> change_square(square)
      %Ecto.Changeset{data: %Square{}}

  """
  def change_square(%Square{} = square, attrs \\ %{}) do
    Square.changeset(square, attrs)
  end

  alias Server.TicTacToe.Score

  @doc """
  Returns the list of scores.

  ## Examples

      iex> list_scores()
      [%Score{}, ...]

  """
  def list_scores do
    Repo.all(Score)
  end

  @doc """
  Gets a single score.

  Raises `Ecto.NoResultsError` if the Score does not exist.

  ## Examples

      iex> get_score!(123)
      %Score{}

      iex> get_score!(456)
      ** (Ecto.NoResultsError)

  """
  def get_score!(id), do: Repo.get!(Score, id)

  @doc """
  Creates a score.

  ## Examples

      iex> create_score(%{field: value})
      {:ok, %Score{}}

      iex> create_score(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_score(attrs \\ %{}) do
    %Score{}
    |> Score.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a score.

  ## Examples

      iex> update_score(score, %{field: new_value})
      {:ok, %Score{}}

      iex> update_score(score, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_score(%Score{} = score, attrs) do
    score
    |> Score.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a score.

  ## Examples

      iex> delete_score(score)
      {:ok, %Score{}}

      iex> delete_score(score)
      {:error, %Ecto.Changeset{}}

  """
  def delete_score(%Score{} = score) do
    Repo.delete(score)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking score changes.

  ## Examples

      iex> change_score(score)
      %Ecto.Changeset{data: %Score{}}

  """
  def change_score(%Score{} = score, attrs \\ %{}) do
    Score.changeset(score, attrs)
  end
end
