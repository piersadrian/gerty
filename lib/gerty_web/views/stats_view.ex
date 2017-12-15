defmodule GertyWeb.StatsView do
  use GertyWeb, :view
  alias GertyWeb.StatsView

  def render("index.json", _) do
    count = (1.0 - :rand.uniform) * 100
    data = Enum.map(0..trunc(count), fn (_) ->
      %{
        sampled_at: DateTime.from_unix!(1464096368 + trunc(:rand.uniform * 1.0e8)),
        count: trunc(:rand.uniform * 100)
      }
    end)

    %{ data: data }
  end
end
