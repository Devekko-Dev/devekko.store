defmodule Store.Accounts.User do
  use Ash.Resource,
    otp_app: :store,
    domain: Store.Accounts,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication],
    data_layer: AshPostgres.DataLayer

  policies do
    bypass(AshAuthentication.Checks.AshAuthenticationInteraction) do
      authorize_if(always())
    end

    policy(always()) do
      forbid_if(always())
    end
  end

  authentication do
    tokens do
      enabled? true
      token_resource Store.Accounts.Token
      signing_secret Store.Secrets
      store_all_tokens? true
    end
  end

  postgres do
    table "users"
    repo Store.Repo
  end

  attributes do
    uuid_primary_key(:id)
  end

  actions do
    defaults([:read])

    read :get_by_subject do
      description("Get a user by the subject claim in a JWT")
      argument(:subject, :string, allow_nil?: false)
      get?(true)
      prepare(AshAuthentication.Preparations.FilterBySubject)
    end
  end
end
