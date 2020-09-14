defmodule DockerElixirClient.Container do
  alias DockerElixirClient.HTTP

  def all(host) when is_binary(host) do
    HTTP.get(host <> "/containers/json", %{all: true})
  end

  def all(host, opts) when is_map(opts) do
    HTTP.get(host <> "/containers/json", opts)
  end

  def create(host, opts) when is_map(opts) do
    HTTP.post(host <> "/containers/create", opts)
  end
end
