defmodule EcommerceApiEcommerceProduct do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    if endpoint(:products_one) do
      path("/ecommerce/products/{id}")
    end =
      ""

    endpoints do
      base("https://developers.apideck.com")

      endpoint :products_one do
        path("/ecommerce/products/{id}")
      end
    end

    fields do
      field :id do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
    read(:products_one)
  end

  attributes do
    attribute :id, :string do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:categories, :string)

    attribute(:created_at, :string)

    attribute(:description, :string)

    attribute(:images, :string)

    attribute(:inventory_quantity, :string)

    attribute(:name, :string)

    attribute(:options, :string)

    attribute(:price, :string)

    attribute(:sku, :string)

    attribute :status, :atom do
      constraints(one_of: [:active, :archived])
    end

    attribute(:tags, :string)

    attribute(:updated_at, :string)

    attribute(:variants, :map)

    attribute(:weight, :string)

    attribute(:weight_unit, :string)
  end
end