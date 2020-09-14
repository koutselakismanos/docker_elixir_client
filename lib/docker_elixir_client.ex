defmodule DockerElixirClient do
  use Application

  def start(_type, _args) do
    Application.ensure_all_started(:httpoison)
  end
end
