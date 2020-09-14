use Mix.Config

config :docker_elixir_client,
       :uri,
       System.get_env("DOCKER_API_URL") || "http+unix://%2fvar%2frun%2fdocker.sock/v1.40"
