defmodule PollerPhxWeb.Api.ChoiceView do
  use PollerPhxWeb, :view

  def render("index.json", %{choices: choices}) do
    render_many(choices, __MODULE__, "show.json")
  end

  def render("show.json", %{choice: choice}) do
    %{
      description: choice.description,
      id: choice.id,
      party_id: choice.party,
      question_id: choice.question_id
    }
  end
end
