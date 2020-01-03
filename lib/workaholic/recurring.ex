defmodule Workaholic.Recurring do
  use GenServer

  require Logger

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_state) do
    GenServer.cast(__MODULE__, :perform)

    {:ok, :ready}
  end

  def handle_cast(:perform, state) do
    perform()

    {:noreply, :busy}
  end

  defp perform do
    if enabled() do
      Logger.info("[Workaholic.Recurring] Doing some work... ⚡️")
      :timer.sleep(:timer.seconds(5))
    else
      Logger.info("[Workaholic.Recurring] Disabled going to sleep 💤")
      :timer.sleep(:infinity)
    end

    GenServer.cast(__MODULE__, :perform)
  end

  defp enabled do
    Application.get_env(:workaholic, __MODULE__)[:enabled]
  end
end
