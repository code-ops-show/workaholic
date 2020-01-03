defmodule WorkaholicTest do
  use ExUnit.Case
  doctest Workaholic

  test "greets the world" do
    assert Workaholic.hello() == :world
  end
end
