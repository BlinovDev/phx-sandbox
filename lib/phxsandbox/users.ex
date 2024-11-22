defmodule Phxsandbox.Users do
  @moduledoc """
  Phxsandbox.Users
  """

  alias Phxsandbox.Users.User

  def list_users do
    [
      %User{id: 1, nickname: "CryptoAlice", name: "Alice", surname: "Crypto"},
      %User{id: 2, nickname: "CryptoBob", name: "Bob", surname: "Crypto"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), &(&1.id == id))
  end
end
