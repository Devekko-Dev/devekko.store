defmodule Store.Seller do
  use Ash.Domain, otp_app: :store, extensions: [AshGraphql.Domain, AshJsonApi.Domain, AshPhoenix]

  resources do
    resource Store.Seller.Seller do
      define :create_seller, action: :create
      define :update_seller, action: :update
      define :destroy_seller, action: :destroy
      define :read_sellers, action: :read
      define :get_seller_by_id, action: :read, get_by: :id
    end
  end
end
