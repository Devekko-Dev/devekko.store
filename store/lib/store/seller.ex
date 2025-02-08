defmodule Store.Seller do
  use Ash.Domain, otp_app: :store, extensions: [AshGraphql.Domain, AshJsonApi.Domain]

  resources do
    resource(Store.Seller.Seller)
  end
end
