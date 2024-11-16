defmodule Phxsandbox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxsandboxWeb.Telemetry,
      Phxsandbox.Repo,
      {DNSCluster, query: Application.get_env(:phxsandbox, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Phxsandbox.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Phxsandbox.Finch},
      # Start a worker by calling: Phxsandbox.Worker.start_link(arg)
      # {Phxsandbox.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxsandboxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phxsandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxsandboxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
