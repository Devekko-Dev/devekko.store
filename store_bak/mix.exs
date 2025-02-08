defmodule Store.MixProject do
  use Mix.Project

  def project do
    [
      app: :store,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :dev,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Store.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:ash_admin, "~> 0.12.5"},
      {:ash_csv, "~> 0.9.7"},
      {:ash_json_api, "~> 1.0"},
#      {:ash_json_api_wrapper, github: "ash-project/ash_json_api_wrapper", only: [:dev, :gpu], override: true},
      {:ash_json_api_wrapper, path: "lib/store/deps/ash_json_api_wrapper", only: [:dev], override: true},
      {:ash_json_gen_ecommerce_api, path: "lib/store/deps/ash_json_gen_ecommerce_api", only: [:dev], override: true},
      {:ash_graphql, "~> 1.0"},
      {:ash_money, "~> 0.1"},
      {:ash_phoenix, "~> 2.0"},
      {:ash_postgres, "~> 2.0"},
      {:ash_state_machine, "~> 0.2.7"},
      {:ash, "~> 3.0"},
      {:ash_slug, "~> 0.1.1"},
      {:bandit, "~> 1.5"},
      {:dns_cluster, "~> 0.1.1"},
      {:ecto_sql, "~> 3.10"},
      {:ex_json_schema, "~> 0.10.2"},
      {:ex_money_sql, "~> 1.0"},
      {:esbuild, "~> 0.8", runtime: Mix.env() == [:dev, :gpu]},
      {:finch, "~> 0.13"},
      {:floki, ">= 0.30.0", only: :test},
      {:gettext, "~> 0.26"},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.1.1",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},
      {:igniter, "~> 0.5.8", only: [:dev, :gpu, :test]},
      {:jason, "~> 1.2"},
      {:open_api_spex, "~> 3.0"},
      {:phoenix, "~> 1.7"},
      {:phoenix_ecto, "~> 4.6"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_reload, "~> 1.2", only: [:dev, :gpu]},
      {:phoenix_live_view, "~> 1.0.0"},
      {:phoenix_live_dashboard, "~> 0.8.3"},
      {:postgrex, ">= 0.0.0"},
      {:swoosh, "~> 1.5"},
      {:smokestack, "~> 0.9.1"},
      {:tailwind, "~> 0.2.4", runtime: Mix.env() == [:dev, :gpu]},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ash.setup", "assets.setup", "assets.build", "run priv/repo/seeds.exs"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ash.setup --quiet", "test"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind store", "esbuild store"],
      "assets.deploy": [
        "tailwind store --minify",
        "esbuild store --minify",
        "phx.digest"
      ]
    ]
  end
end
