defmodule ServerWeb.ScoreView do
  use ServerWeb, :view
  alias ServerWeb.ScoreView

  def render("index.json", %{scores: scores}) do
    %{data: render_many(scores, ScoreView, "score.json")}
  end

  def render("show.json", %{score: score}) do
    %{data: render_one(score, ScoreView, "score.json")}
  end

  def render("score.json", %{score: score}) do
    %{
      id: score.id,
      X: Map.fetch!(score, :X),
      O: Map.fetch!(score, :O)
    }
  end
end
