defmodule PollerPhxWeb.Router do
  use PollerPhxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PollerPhxWeb.Plugs.Auth
  end

  scope "/", PollerPhxWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", PollerPhxWeb do
    pipe_through :browser

    get "/login", AuthController, :new
    post "/login", AuthController, :create
  end

  scope "/districts", PollerPhxWeb do
    pipe_through [:browser, :valid_user, :admin_user]

    resources "/", DistrictController, except: [:show]
    resources "/:district_id/questions", QuestionController, except: [:show]

    resources "/:district_id/questions/:question_id/choices",
              ChoiceController,
              except: [:show]
  end
end
