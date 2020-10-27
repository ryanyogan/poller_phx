defmodule PollerPhxWeb.QuestionController do
  use PollerPhxWeb, :controller

  alias PollerDal.{Questions, Districts}

  def index(conn, %{"id" => district_id}) do
    district = Districts.get_district!(district_id)
    questions = Questions.list_questions_by_district_id(district_id)

    render(conn, "index.html", district: district, questions: questions)
  end
end
