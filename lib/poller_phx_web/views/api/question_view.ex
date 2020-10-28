defmodule PollerPhxWeb.Api.QuestionView do
  use PollerPhxWeb, :view

  def render("index.json", %{questions: questions}) do
    render_many(questions, __MODULE__, "show.json")
  end

  def render("show.json", %{question: question}) do
    %{
      id: question.id,
      description: question.description,
      district_id: question.district_id
    }
  end
end
