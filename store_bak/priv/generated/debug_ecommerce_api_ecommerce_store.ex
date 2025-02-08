defmodule EcommerceApiEcommerceStore do
  use Ash.Resource,
    domain: Elixir.API.Gen.Ecommerce.Domain,
    extensions: [
      AshAdmin.Resource,
      AshJsonApi.Resource,
      AshGraphql.Resource,
      AshSlug
    ]

  "AshStateMachine"
  "AshSlug"
  "AshJsonApi.Resource"
  "AshGraphql.Resource"
  "AshAdmin.Resource"

  resource do
    require_primary_key?(false)
  end

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    endpoints do
      base("https://developers.apideck.com")

      endpoint :stores_one do
        path("/ecommerce/store")
      end
    end

    fields do
      field :id do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
    read(:stores_one)
  end

  attributes do
    attribute :id, :string do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:admin_url, :string)

    attribute(:created_at, :string)

    attribute(:name, :string)

    attribute(:store_url, :string)

    attribute(:updated_at, :string)
  end
end