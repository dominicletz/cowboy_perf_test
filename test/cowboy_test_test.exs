defmodule CowboyTestTest do
  use ExUnit.Case
  doctest CowboyTest

  test "greets the world" do
    assert CowboyTest.hello() == :world
  end
end
