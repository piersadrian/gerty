defmodule GertyWeb.Router do
  use GertyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GertyWeb do
    pipe_through :api
    get "/stats", StatsController, :index
  end
end
