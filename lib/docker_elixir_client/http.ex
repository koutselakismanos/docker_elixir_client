defmodule DockerElixirClient.HTTP do
  def get(url) do
    HTTPoison.get(url)
  end

  def get(url, params) when is_map(params) do
    (url <> "?#{encode_query_params(params)}")
    |> HTTPoison.get()
    |> handle_response
  end

  def post(url, params \\ %{}) do
    HTTPoison.post(url, Poison.encode!(params), %{"Content-Type" => "application/json"})
    |> handle_response
  end

  def put(url, params \\ %{}) do
    HTTPoison.put(url, Poison.encode!(params), %{"Content-Type" => "application/json"})
    |> handle_response
  end

  def delete(url) do
    HTTPoison.delete(url)
    |> handle_response
  end

  def delete(url, params) do
    (url <> "?#{encode_query_params(params)}")
    |> HTTPoison.delete()
    |> handle_response
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 201, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 204, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 301, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 304, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 404, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 500, body: _body}} = resp) do
    parse_response(resp)
  end

  def handle_response({:error, %HTTPoison.Error{id: _, reason: _reason}} = resp) do
    parse_response(resp)
  end

  defp parse_response({:error, %HTTPoison.Error{id: _, reason: reason}}) do
    {:error, reason, 500}
  end

  defp parse_response(
         {:ok, %HTTPoison.Response{body: "", headers: _headers, status_code: code} = resp}
       ) do
    {:ok, resp.body, code}
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, headers: headers, status_code: code}}) do
    {"Content-Type", type} = List.keyfind(headers, "Content-Type", 0)

    case type do
      "text/plain; charset=utf-8" ->
        {:ok, body, code}

      "application/json" ->
        {:ok, Poison.decode!(body), code}
    end
  end

  defp encode_query_params(params) do
    URI.encode_query(params)
  end
end
