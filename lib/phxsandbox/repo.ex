defmodule Phxsandbox.Repo do
  use Ecto.Repo,
    otp_app: :phxsandbox,
    adapter: Ecto.Adapters.Postgres
end
