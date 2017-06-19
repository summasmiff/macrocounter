defmodule Macrocounter.PageController do
  use Macrocounter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
