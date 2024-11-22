defmodule PhxsandboxWeb.UserController do
  use PhxsandboxWeb, :controller

  alias Phxsandbox.Users

  def index(conn, _params) do
    users = Users.list_users()

    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    case Integer.parse(id) do
      {int_id, ""} ->
        user = Users.get_user(int_id)

        case user do
          nil ->
            conn
            |> put_flash(:error, "User not found!")
            |> redirect(to: ~p"/users")

          _ ->
            render(conn, :show, user: user)
        end

      _ ->
        conn
        |> put_flash(:error, "Invalid ID format!")
        |> redirect(to: ~p"/users")
    end
  end
end
