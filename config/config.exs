# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_1_5_live_view_chirp,
  ecto_repos: [Phoenix15LiveViewChirp.Repo]

# Configures the endpoint
config :phoenix_1_5_live_view_chirp, Phoenix15LiveViewChirpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VaZex92AhWQJw9cDRQstZjbM0K7b3+V2+A494UrnN6mEsgrt+r/WKnCkqY3Wh65c",
  render_errors: [view: Phoenix15LiveViewChirpWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Phoenix15LiveViewChirp.PubSub,
  live_view: [signing_salt: "qMfVRj2V"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
