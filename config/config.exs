# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :macrocounter,
  ecto_repos: [Macrocounter.Repo]

# Configures the endpoint
config :macrocounter, Macrocounter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "214Ym3glU7QFX5n78lfnD59OPG73MDPKeHRuOGX7a3BJ8GErHbgpWZbXbaQ0Vgv9",
  render_errors: [view: Macrocounter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Macrocounter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
