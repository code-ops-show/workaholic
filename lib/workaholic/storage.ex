defmodule Workaholic.Storage do
  use Agent
  
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def current do
    Agent.get(__MODULE__, fn state -> 
      state
    end)
  end

  def add(number) do
    Agent.update(__MODULE__, fn state -> 
      state + number
    end)
  end
end