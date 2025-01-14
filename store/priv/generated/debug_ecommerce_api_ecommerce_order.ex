defmodule EcommerceApiEcommerceOrder do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    if endpoint(:orders_one) do
      path("/ecommerce/orders/{id}")
    end =
      ""

    endpoints do
      base("https://developers.apideck.com")

      endpoint :orders_one do
        path("/ecommerce/orders/{id}")
      end
    end

    fields do
      field :id do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
    read(:orders_one)
  end

  attributes do
    attribute :id, :string do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:billing_address, :string)

    attribute(:created_at, :string)

    attribute :currency, :atom do
      constraints(one_of: [:AUD, :CAD, :GBP, :HKD, :USD, :BTC, :ETH])
    end

    attribute(:customer, :string)

    attribute(:discounts, :map)

    attribute :fulfillment_status, :atom do
      constraints(
        one_of: [:pending, :shipped, :partial, :delivered, :cancelled, :returned, :unknown]
      )
    end

    attribute(:line_items, :map)

    attribute(:note, :string)

    attribute(:order_number, :string)

    attribute(:payment_method, :string)

    attribute :payment_status, :atom do
      constraints(one_of: [:pending, :authorized, :paid, :partial, :refunded, :voided, :unknown])
    end

    attribute(:shipping_address, :string)

    attribute(:shipping_cost, :string)

    attribute :status, :atom do
      constraints(one_of: [:active, :completed, :cancelled, :archived, :unknown])
    end

    attribute(:sub_total, :string)

    attribute(:total_amount, :string)

    attribute(:total_discount, :string)

    attribute(:total_tax, :string)

    attribute(:tracking, :map)

    attribute(:updated_at, :string)
  end
end