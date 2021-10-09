defmodule Server.TicTacToe.Score do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scores" do
    field :O, :integer
    field :X, :integer

    timestamps()
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:X, :O])
    # |> validate_required([:X, :O])
  end
end
