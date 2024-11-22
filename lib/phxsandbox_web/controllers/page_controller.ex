defmodule PhxsandboxWeb.PageController do
  use PhxsandboxWeb, :controller

  plug :check_location when action in [:info]
  plug :conn_info when action in [:info]

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  # /info/City?user=Anton
  def info(conn, %{"location" => location} = params) do
    user = params |> Map.get("user", "unknown")

    render(conn, :info, user: user, location: location)
  end

  def about(conn, %{"format" => format} = params) do
    format = params |> Map.get("format", "unknown")

    case format do
      "json" ->
        conn
        |> put_resp_content_type("application/json")
        |> put_status(200)
        |> json(%{site_info: "© 2024 Anton Blinov"})

      _default ->
        conn
        |> send_resp(418, "")
    end
  end


  def conn_info(%Plug.Conn{path_params: path_params, query_params: query_params} = conn, _opts) do
    conn |> IO.inspect(label: "INSPECTING CONNECTION")

    location = path_params |> Map.get("location", "unknown")
    user = query_params |> Map.get("user", "unknown")

    conn |> put_flash(:info, "Hello #{user} from #{location}!")
  end

  defp check_location(%Plug.Conn{path_params: path_params} = conn, _opts) do
    location = path_params |> Map.get("location", "unknown")

    case location do
      "forbidden" ->
        conn |> put_flash(:error, "Forbidden location!") |> redirect(to: ~p"/") |> halt()

      _default ->
        conn
    end
  end
end
