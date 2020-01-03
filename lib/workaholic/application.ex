defmodule Workaholic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Workaholic.MathServer,
      Workaholic.OnBoot,
      Workaholic.Recurring,
      {Task.Supervisor, name: Workaholic.DistSupervisor}
      # Starts a worker by calling: Workaholic.Worker.start_link(arg)
      # {Workaholic.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Workaholic.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
