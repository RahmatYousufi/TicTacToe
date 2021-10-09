defmodule Server.TicTacToe.Square do
  use Ecto.Schema
  import Ecto.Changeset

  schema "squares" do
    field :square_eight, :string
    field :square_five, :string
    field :square_four, :string
    field :square_one, :string
    field :square_seven, :string
    field :square_six, :string
    field :square_three, :string
    field :square_two, :string
    field :square_zero, :string

    timestamps()
  end

  @doc false
  def changeset(square, attrs) do
    square
    |> cast(attrs, [:square_zero, :square_one, :square_two, :square_three, :square_four, :square_five, :square_six, :square_seven, :square_eight])
  end
end
