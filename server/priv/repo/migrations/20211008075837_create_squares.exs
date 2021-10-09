defmodule Server.Repo.Migrations.CreateSquares do
  use Ecto.Migration

  def change do
    create table(:squares) do
      add :square_zero, :string
      add :square_one, :string
      add :square_two, :string
      add :square_three, :string
      add :square_four, :string
      add :square_five, :string
      add :square_six, :string
      add :square_seven, :string
      add :square_eight, :string

      timestamps()
    end
  end
end
