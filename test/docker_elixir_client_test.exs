defmodule DockerElixirClientTest do
  use ExUnit.Case
  doctest DockerElixirClient

  test "greets the world" do
    assert DockerElixirClient.hello() == :world
  end
end
