defmodule Store.Product do
  use Ash.Domain, otp_app: :store, extensions: [AshGraphql.Domain, AshJsonApi.Domain]

  resources do
    resource(Store.Product.Product)
  end
end
