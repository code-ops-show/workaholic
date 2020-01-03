defmodule Workaholic.MathServer do
  use GenServer

  def start_link(_options) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def current do
    GenServer.call(__MODULE__, :current)
  end

  def add(number) do
    GenServer.call(__MODULE__, {:add, number})
  end

  def init(starting_value) do
    {:ok, starting_value}
  end

  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:add, number}, _from, state) do
    result = number + state
    {:reply, result, result}
  end
end
