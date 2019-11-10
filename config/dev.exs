use Mix.Config

config :poller_phx, PollerPhxWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :poller_phx, PollerPhxWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/poller_phx_web/{live,views}/.*(ex)$",
      ~r"lib/poller_phx_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :poller_dal, PollerDal.Repo,
  database: "poller_#{Mix.env()}",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :poller_dal,
  ecto_repos: [PollerDal.Repo]
