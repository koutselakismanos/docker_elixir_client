use Mix.Config

docker_engine_version = System.get_env("DOCKER_ENGINE_VERSION") || "1.40"

docker_engine_uri =
  System.get_env("DOCKER_ENGINE_URI") ||
    "http+unix://%2fvar%2frun%2fdocker.sock/v#{docker_engine_version}"

config :docker_elixir_client,
       :uri,
       docker_engine_uri

import_config "#{Mix.env()}.exs"
