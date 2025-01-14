defmodule EcommerceApiEcommerceCustomer do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    if endpoint(:customers_one) do
      path("/ecommerce/customers/{id}")
    end =
      ""

    endpoints do
      base("https://developers.apideck.com")

      endpoint :customers_one do
        path("/ecommerce/customers/{id}")
      end
    end

    fields do
      field :id do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
    read(:customers_one)
  end

  attributes do
    attribute :id, :string do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:addresses, :string)

    attribute(:company_name, :string)

    attribute(:created_at, :string)

    attribute :currency, :atom do
      constraints(one_of: [:AUD, :CAD, :GBP, :HKD, :USD, :BTC, :ETH])
    end

    attribute(:emails, :string)

    attribute(:first_name, :string)

    attribute(:last_name, :string)

    attribute(:name, :string)

    attribute(:orders, :map)

    attribute(:phone_numbers, :string)

    attribute :status, :atom do
      constraints(one_of: [:active, :archived])
    end

    attribute(:updated_at, :string)
  end
end