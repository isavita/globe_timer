defmodule GlobeTimer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GlobeTimerWeb.Telemetry,
      # Start the Ecto repository
      GlobeTimer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GlobeTimer.PubSub},
      # Start Finch
      {Finch, name: GlobeTimer.Finch},
      # Start the Endpoint (http/https)
      GlobeTimerWeb.Endpoint
      # Start a worker by calling: GlobeTimer.Worker.start_link(arg)
      # {GlobeTimer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GlobeTimer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlobeTimerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
