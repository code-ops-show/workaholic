defmodule Workaholic.OnBoot do
  use Task

  require Logger

  def start_link(arg) do
    Task.start_link(__MODULE__, :perform, [arg])
  end

  def perform(_arg) do
    Logger.info("[Workaholic.OnBoot] Running on boot... 🥾")
  end
end
