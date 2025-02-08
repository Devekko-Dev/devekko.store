defmodule Store.Secrets do
  use AshAuthentication.Secret

  def secret_for([:authentication, :tokens, :signing_secret], Store.Accounts.User, _opts) do
    Application.fetch_env(:store, :token_signing_secret)
  end
end
