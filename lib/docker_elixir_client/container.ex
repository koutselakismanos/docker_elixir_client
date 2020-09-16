defmodule DockerElixirClient.Container do
  alias DockerElixirClient.HTTP

  @context "containers"

  @doc """
  Returns a list of containers
  """
  def list(params \\ %{}, opts \\ []) do
    "/#{@context}/json"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Create a container
  """
  def create(body \\ %{}, params \\ %{}, opts \\ []) do
    "/#{@context}/create"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Return low-level information about a container
  """
  def inspect(id, body \\ %{}, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/json"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, body, [], opts)
  end

  @doc """
  List processes running inside a container. Only unix
  """
  def list_processes(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/top"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Get `stdout` and `stderr` logs from a container
  """
  def get_logs(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/logs"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Get changes on a container’s filesystem
  Returns which files in a container's filesystem have been added, deleted, or modified. The Kind of modification can be one of:

  0: Modified
  1: Added
  2: Deleted
  """
  def changes(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/changes"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Export the contents of a container as a tarball
  """
  def export(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/export"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Get container stats based on resource usage
  """
  def stats(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/stats"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Get container stats based on resource usage
  """
  def resize(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/resize"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Start a container
  """
  def start(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/start"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Stop a container
  """
  def stop(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/stop"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Restart a container
  """
  def restart(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/restart"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Kill a container by sending a POSIX signal to a container,
  defaulting to killing to the container
  """
  def kill(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/kill"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Update a container
  """
  def update(id, body \\ %{}, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/update"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, body, [], opts)
  end

  @doc """
  Rename a container
  """
  def rename(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/rename"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Pause a container
  """
  def pause(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/pause"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Unpause a container
  """
  def unpause(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/unpause"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Wait for a container
  """
  def wait(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/wait"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end

  @doc """
  Remove a container
  """
  def remove(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:delete, %{}, [], opts)
  end

  @doc """
  Get an archive of a filesystem resource in a container
  """
  def get_archive(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/archive"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:get, %{}, [], opts)
  end

  @doc """
  Extract an archive of files or folders to a directory in a container
  """
  def extract_archive(id, params \\ %{}, opts \\ []) do
    "/#{@context}/#{id}/archive"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:put, %{}, [], opts)
  end

  @doc """
  Delete stopped containers
  """
  def delete_stopped(params \\ %{}, opts \\ []) do
    "/#{@context}/prune"
    |> HTTP.add_query_params(params)
    |> HTTP.send_request(:post, %{}, [], opts)
  end
end
