defmodule Store.Product do
  use Ash.Domain, otp_app: :store, extensions: [AshGraphql.Domain, AshJsonApi.Domain, AshPhoenix]

  resources do
    resource(Store.Product.Product) do
      define(:create_product, action: :create)
      define(:update_product, action: :update)
      define(:destroy_product, action: :destroy)
      define(:read_product, action: :read)
      define(:get_product_by_id, action: :read, get_by: :id)
    end
  end
end
