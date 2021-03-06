use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :eval, Eval.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :eval, Eval.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "eval_db_user",
  password: "eval_pass",
  database: "eval_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
