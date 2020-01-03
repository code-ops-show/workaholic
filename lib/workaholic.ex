defmodule Workaholic do
  @moduledoc """
  Documentation for Workaholic.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Workaholic.hello()
      :world

  """

  def in_tasks do
    Enum.map(1..100, fn i -> 
      Task.async(fn -> 
        :timer.sleep(500)
        1 + 5
      end)
    end)
  end

  def in_task_async_stream do
    Task.async_stream(1..100, fn i -> 
      :timer.sleep(500)
      1 + 5
    end)
  end

  def block_world do
    Enum.map(1..100, fn i -> 
      :timer.sleep(500)
      1 + 5
    end)
  end

  def perform_distributed_task(node, module, function, args \\ []) do
    Task.Supervisor.async({Workaholic.DistSupservisor, node}, module, function, args)
  end
end
