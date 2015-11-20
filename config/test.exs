use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :castle, Castle.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :castle, Castle.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "teaspoon",
  password: "",
  database: "castle_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
