defmodule DemoStreamDataTest do
  use ExUnit.Case
  doctest DemoStreamData

  test "greets the world" do
    assert DemoStreamData.hello() == :world
  end
end
