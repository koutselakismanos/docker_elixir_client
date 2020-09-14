defmodule DockerElixirClient.HTTP do
  def get(url) do
    HTTPoison.get(url)
  end

  def get(url, opts) when is_map(opts) do
    url = url <> "?#{encode_query_params(opts)}"
    HTTPoison.get(url)
  end

  def post(url, opts \\ %{}) do
    HTTPoison.post(url, Poison.encode!(opts), %{"Content-type" => "application/json"})
  end

  def delete(url, opts) do
    url = url <> "?#{encode_query_params(opts)}"
    HTTPoison.delete(url)
  end

  defp encode_query_params(opts) do
    URI.encode_query(opts)
  end
end
