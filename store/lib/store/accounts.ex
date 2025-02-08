defmodule Store.Accounts do
  use Ash.Domain,
    otp_app: :store

  resources do
    resource(Store.Accounts.Token)
    resource(Store.Accounts.User)
  end
end
