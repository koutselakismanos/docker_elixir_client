defmodule DockerElixirClient.Swarm do
  alias DockerElixirClient.HTTP

  @context "swarm"

  @doc """
  Inpsect swarm
  """
  def inspect(opts \\ []) do
    "/#{@context}"
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Initialize a new swarm
  """
  def initialize(body \\ %{}, opts \\ []) do
    "/#{@context}/init"
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Join an existing swarm
  """
  def join(body \\ %{}, opts \\ []) do
    "/#{@context}/join"
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Leave a swarm
  """
  def leave(params \\ %{}, opts \\ []) do
    "/#{@context}/leave"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Update a swarm
  """
  def update(body \\ %{}, params \\ %{}, opts \\ []) do
    "/#{@context}/update"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Get the unlock key
  """
  def get_unlock_key(opts \\ []) do
    "/#{@context}/unlockkey"
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Unlock a locked manager
  """
  def unlock_manager(body \\ %{}, opts \\ []) do
    "/#{@context}/unlockkey"
    |> HTTP.send_request(:post, body, [], opts)
  end
end
