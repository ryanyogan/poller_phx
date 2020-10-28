defmodule PollerPhxWeb.Api.DistrictView do
  use PollerPhxWeb, :view

  def render("index.json", %{districts: districts}) do
    render_many(districts, __MODULE__, "show.json")
  end

  def render("show.json", %{district: district}) do
    %{id: district.id, name: district.name}
  end
end
