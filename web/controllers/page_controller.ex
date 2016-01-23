defmodule Timestamp.PageController do
  use Timestamp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
