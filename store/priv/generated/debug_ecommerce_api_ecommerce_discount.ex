defmodule EcommerceApiEcommerceDiscount do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    endpoints do
      base("https://developers.apideck.com")
    end

    fields do
      field :orderId do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
  end

  attributes do
    attribute(:amount, :string)

    attribute(:code, :string)

    attribute(:percentage, :string)
  end
end