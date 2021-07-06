defmodule QuestradeClient.HTTPClientSpec do
  use ESpec

  alias QuestradeClient.{HTTPClient, Collection}

  let :endpoint, do: "/api/v2/users/223443.json"
  let :url, do: HTTPClient.build_url endpoint()
  let :param, do: %{}
  let :body, do: Poison.encode!(param())
  let :headers, do: ["Content-Type": "application/json"]
  let :basic_auth, do: HTTPClient.basic_auth
  let :json_user, do: ~s({"user":{"id":223443,"name":"Johnny Agent"}})
  let :response, do: %HTTPotion.Response{body: json_user()}

  describe "get" do
    before do: allow HTTPotion |> to(accept :get, fn(_, _) -> response() end)

    it "calls HTTPotion.get" do
      HTTPClient.get endpoint()
      expect HTTPotion |> to(accepted :get, [url(), [basic_auth: basic_auth()]])
    end
  end

  describe "post" do
    before do: allow HTTPotion |> to(accept :post, fn(_, _) -> response() end)

    it "calls HTTPotion.post" do
      HTTPClient.post endpoint(), param()
      expect HTTPotion |> to(accepted :post, [url(), [body: body(), headers: headers(), basic_auth: basic_auth()]])
    end
  end

  describe "put" do
    before do: allow HTTPotion |> to(accept :put, fn(_, _) -> response() end)

    it "calls HTTPotion.put" do
      HTTPClient.put endpoint(), param()
      expect HTTPotion |> to(accepted :put, [url(), [body: body(), headers: headers(), basic_auth: basic_auth()]])
    end
  end

  describe "delete" do
    before do: allow HTTPotion |> to(accept :delete, fn(_, _) -> response() end)

    it "calls HTTPotion.delete" do
      HTTPClient.delete endpoint()
      expect HTTPotion |> to(accepted :delete, [url(), [basic_auth: basic_auth()]])
    end
  end

  describe "build_url" do
    subject do: HTTPClient.build_url endpoint()
    it do: is_expected() |> to(eq "https://test.questrade.com/api/v2/users/223443.json")
  end

  describe "basic_auth" do
    subject do: HTTPClient.basic_auth
    it do: is_expected() |> to(eq {"testuser@testdomain.questrade.com/token", "testapitoken"})
  end
end
