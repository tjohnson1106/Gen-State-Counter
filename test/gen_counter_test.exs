defmodule GenCounterTest do
  use ExUnit.Case
  doctest GenCounter

  test "greets the world" do
    assert GenCounter.hello() == :world
  end
end
