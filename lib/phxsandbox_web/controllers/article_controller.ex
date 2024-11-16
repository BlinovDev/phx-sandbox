defmodule PhxsandboxWeb.ArticleController do
  use PhxsandboxWeb, :controller

  def index(conn, _params) do
    articles = ["Some article", "Some another article"]

    render(conn, :index, data: articles)
  end

  def show() do
  end

  def new() do
  end
end
