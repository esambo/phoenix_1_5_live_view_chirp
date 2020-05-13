defmodule Phoenix15LiveViewChirp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Phoenix15LiveViewChirp.Repo,
      # Start the Telemetry supervisor
      Phoenix15LiveViewChirpWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phoenix15LiveViewChirp.PubSub},
      # Start the Endpoint (http/https)
      Phoenix15LiveViewChirpWeb.Endpoint
      # Start a worker by calling: Phoenix15LiveViewChirp.Worker.start_link(arg)
      # {Phoenix15LiveViewChirp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phoenix15LiveViewChirp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Phoenix15LiveViewChirpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
