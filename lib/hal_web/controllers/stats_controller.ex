defmodule HALWeb.StatsController do
  use HALWeb, :controller

  def index(conn, _params) do
    rand = :rand.uniform * 10

    if rand < 9 do
      Process.sleep(trunc(rand * 500))
      render(conn, "index.json")
    else
      req = Map.get(conn, :adapter)
      :cowboy_req.reply("LOL BROKEN", elem(req, 1))
      %{conn | state: :sent}
    end
  end
end
