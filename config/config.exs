use Mix.Config

docker_engine_version = System.get_env("DOCKER_ENGINE_VERSION") || "1.40"

docker_engine_uri =
  System.get_env("DOCKER_ENGINE_URI") ||
    "http+unix://%2fvar%2frun%2fdocker.sock/v#{docker_engine_version}"

config :docker_elixir_client,
       :uri,
       docker_engine_uri

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
