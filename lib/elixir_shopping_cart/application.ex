defmodule ElixirShoppingCart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirShoppingCartWeb.Telemetry,
      # Start the Ecto repository
      ElixirShoppingCart.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirShoppingCart.PubSub},
      # Start Finch
      {Finch, name: ElixirShoppingCart.Finch},
      # Start the Endpoint (http/https)
      ElixirShoppingCartWeb.Endpoint
      # Start a worker by calling: ElixirShoppingCart.Worker.start_link(arg)
      # {ElixirShoppingCart.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirShoppingCart.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirShoppingCartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
