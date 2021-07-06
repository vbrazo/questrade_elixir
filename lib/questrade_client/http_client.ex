defmodule QuestradeClient.HTTPClient do
  @content_type "application/json"

  alias QuestradeClient.Collection

  def get("https://" <> _ = url) do
    url |> HTTPotion.get(basic_auth: basic_auth())
  end

  def get(endpoint) do
    endpoint |> build_url |> get
  end

  def get("https://" <> _ = url, decode_as) do
    url |> get
  end

  def get(endpoint, decode_as) do
    endpoint |> build_url |> get(decode_as)
  end

  def post(endpoint, %{} = param) do
    build_url(endpoint)
    |> HTTPotion.post(
      body: Poison.encode!(param),
      headers: ["Content-Type": @content_type],
      basic_auth: basic_auth()
    )
  end

  def put(endpoint, %{} = param) do
    build_url(endpoint)
    |> HTTPotion.put(
      body: Poison.encode!(param),
      headers: ["Content-Type": @content_type],
      basic_auth: basic_auth()
    )
  end

  def delete(endpoint, decode_as), do: delete(endpoint)

  def delete(endpoint) do
    build_url(endpoint) |> HTTPotion.delete(basic_auth: basic_auth())
  end

  def build_url(endpoint) do
    "https://#{get_env(:subdomain)}.questrade.com#{endpoint}"
  end

  def basic_auth do
    {"#{get_env(:user)}/token", "#{get_env(:api_token)}"}
  end

  defp get_env(key) do
    case Process.get(:questrade_config_module) do
      nil -> Application.get_env(:questrade_client, key)
      config_module -> Application.get_env(:questrade_client, config_module)[key]
    end
  end
end
