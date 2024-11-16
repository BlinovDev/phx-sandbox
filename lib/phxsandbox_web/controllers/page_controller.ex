defmodule PhxsandboxWeb.PageController do
  use PhxsandboxWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def info(conn, _params) do
    render(conn, :info)
  end

end
