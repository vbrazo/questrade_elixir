defmodule QuestradeClient.MixProject do
  use Mix.Project

  @description """
  Questrade REST API client for Elixir
  """

  def project do
    [
      app: :questrade_client,
      version: "0.1.0",
      elixir: "~> 1.11",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [espec: :test],
      deps: deps()
    ]
  end

  defp package do
    [
      maintainers: ["vbrazo"],
      licenses: ["CC0-1.0"],
      links: %{"Github" => "https://github.com/vbrazo/questrade_client"}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:earmark, "~> 1.4.3", only: :dev, runtime: false},
      {:espec, "~> 1.8.2", only: :test},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:httpotion, "~> 3.0"},
      {:poison, "~> 3.0"}
    ]
  end
end
