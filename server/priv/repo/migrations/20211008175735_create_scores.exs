defmodule Server.Repo.Migrations.CreateScores do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :X, :integer
      add :O, :integer

      timestamps()
    end
  end
end
