defmodule DockerElixirClient.Service do
  alias DockerElixirClient.HTTP

  @context "services"

  @doc """
  List services
  """
  def list(params \\ %{}, opts \\ []) do
    "/#{@context}"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Create a service
  """
  def create(body \\ %{}, header \\ [], opts \\ []) do
    "/#{@context}/create"
    |> HTTP.send_request(:post, body, header, opts)
  end

  @doc """
  Inspect a service
  """
  def inspect(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Delete a service
  """
  def delete(id, opts \\ []) do
    "/#{@context}/#{id}"
    |> HTTP.send_request(:delete, %{}, [], opts)
  end

  @doc """
  Update a service
  """
  def update(id, params \\ %{}, header \\ [], opts \\ []) do
    "/#{@context}/#{id}/update"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, header, opts)
  end

  @doc """
  Get service logs
  """
  def logs(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/logs"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end
end
