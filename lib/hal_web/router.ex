defmodule HALWeb.Router do
  use HALWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HALWeb do
    pipe_through :api
    get "/stats", StatsController, :index
  end
end
