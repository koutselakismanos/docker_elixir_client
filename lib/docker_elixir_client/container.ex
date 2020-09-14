defmodule DockerElixirClient.Container do
  alias DockerElixirClient.HTTP

  @doc """
  Returns a list of containers
  """
  def list(host, params \\ %{}) do
    HTTP.get(host <> "/containers/json", params)
  end

  @doc """
  Create a container
  """
  def create(host, params \\ %{}) do
    HTTP.post(host <> "/containers/create", params)
  end

  @doc """
  Return low-level information about a container
  """
  def inspect(host, id, params \\ %{}) do
    HTTP.get(host <> "/containers/#{id}/json", params)
  end

  @doc """
  List processes running inside a container. Only unix
  """
  def list_processes(host, id, params \\ %{}) do
    HTTP.get(host <> "/containers/#{id}/top", params)
  end

  @doc """
  Get `stdout` and `stderr` logs from a container
  """
  def get_logs(host, id, params \\ %{}) do
    HTTP.get(host <> "/containers/#{id}/logs", params)
  end

  @doc """
  Get changes on a container’s filesystem
  Returns which files in a container's filesystem have been added, deleted, or modified. The Kind of modification can be one of:

  0: Modified
  1: Added
  2: Deleted
  """
  def get_changes(host, id) do
    HTTP.get(host <> "/containers/#{id}/changes")
  end

  @doc """
  Export the contents of a container as a tarball
  """
  def export(host, id) do
    HTTP.get(host <> "/containers/#{id}/export")
  end

  @doc """
  Start a container
  """
  def start(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}/start", params)
  end

  @doc """
  Stop a container
  """
  def stop(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}/stop", params)
  end

  @doc """
  Restart a container
  """
  def restart(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}/restart", params)
  end

  @doc """
  Kill a container by sending a POSIX signal to a container,
  defaulting to killing to the container
  """
  def kill(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}/kill", params)
  end

  @doc """
  Update a container
  """
  def update(host, id) do
    HTTP.post(host <> "/containers/#{id}/update")
  end

  @doc """
  Rename a container
  """
  def rename(host, id) do
    HTTP.post(host <> "/containers/#{id}/rename")
  end

  @doc """
  Pause a container
  """
  def pause(host, id) do
    HTTP.post(host <> "/containers/#{id}/pause")
  end

  @doc """
  Unpause a container
  """
  def unpause(host, id) do
    HTTP.post(host <> "/containers/#{id}/unpause")
  end

  @doc """
  Wait for a container
  """
  def wait(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}/unpause", params)
  end

  @doc """
  Remove a container
  """
  def remove(host, id, params \\ %{}) do
    HTTP.post(host <> "/containers/#{id}", params)
  end

  @doc """
  Get an archive of a filesystem resource in a container
  """
  def get_archive(host, id, params \\ %{}) do
    HTTP.get(host <> "/containers/#{id}/archive", params)
  end

  @doc """
  Extract an archive of files or folders to a directory in a container
  """
  def extract_archive(host, id, params \\ %{}) do
    HTTP.put(host <> "/containers/#{id}/archive", params)
  end

  @doc """
  Delete stopped containers
  """
  def delete_stopped(host, params \\ %{}) do
    HTTP.post(host <> "/containers/prune", params)
  end
end
