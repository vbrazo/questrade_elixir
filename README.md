# Questrade Client

Set up a practice account to play around:

http://www.questrade.com/api/free-practice-account

Login with it at:

https://practicelogin.questrade.com/Signin.aspx?ReturnUrl=%2fAPIAccess%2fUserApps.aspx

Register a practice app (give it all permissions, this is a test account)

Generate a new device authorization token, you'll need that! It's considered a "refresh" token. After being used once, it's no more good - you'll get a new refresh token though.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed by adding `questrade_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:questrade_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) and published on [HexDocs](https://hexdocs.pm). Once published, the docs can be found at [https://hexdocs.pm/questrade_client](https://hexdocs.pm/questrade_client).
