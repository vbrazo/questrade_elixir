defmodule QuestradeClientTest do
  use ExUnit.Case
  doctest QuestradeClient

  test "greets the world" do
    assert QuestradeClient.hello() == :world
  end
end
