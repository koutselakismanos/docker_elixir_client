defmodule DockerElixirClient.Swarm do
  alias DockerElixirClient.HTTP

  @doc """
  Inpsect swarm
  """
  def inspect(opts \\ []) do
    "/swarm"
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Initialize a new swarm
  """
  def initialize(body \\ %{}, opts \\ []) do
    "/swarm/init"
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Join an existing swarm
  """
  def join(body \\ %{}, opts \\ []) do
    "/swarm/join"
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Leave a swarm
  """
  def leave(params \\ %{}, opts \\ []) do
    "/swarm/leave"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Update a swarm
  """
  def update(body \\ %{}, params \\ %{}, opts \\ []) do
    "/swarm/update"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Get the unlock key
  """
  def get_unlock_key(opts \\ []) do
    "/swarm/unlockkey"
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Unlock a locked manager
  """
  def unlock_manager(body \\ %{}, opts \\ []) do
    "/swarm/unlockkey"
    |> HTTP.send_request(:post, body, [], opts)
  end
end
