use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bank, BankWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :commanded, event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  url: System.get_env("EVENTSTORE_DATABASE_URL")
