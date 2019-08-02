defmodule WorldDominationLiveWeb.PageController do
  use WorldDominationLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
