defmodule DockerElixirClient.HTTP do
  use HTTPoison.Base

  def default_options do
    [
      connect_timeout: 5000,
      recv_timeout: 30000,
      timeout: 30000
      # stream_to: self()
    ]
  end

  def process_request_url(path) do
    uri = Application.get_env(:docker_elixir_client, :uri)
    "#{uri}#{path}"
  end

  def send_request(url, method, body \\ %{}, headers \\ [], opts \\ []) do
    json_headers = headers ++ [{"Content-Type", "application/json"}]
    merged_opts = opts ++ default_options()
    request!(method, url, body, json_headers, merged_opts)
  end

  def add_query_params(url, params) do
    "#{url}?#{URI.encode_query(params)}"
  end

  def process_request_body("") do
    ""
  end

  def process_request_body(body) do
    Poison.encode!(body)
  end

  def process_response_body("") do
    ""
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end
end
