defmodule EcommerceApiEcommerceCustomer do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    endpoints do
      base("https://developers.apideck.com")

      endpoint :customers_one do
        path("/ecommerce/customers/{id}")
      end
    end

    fields do
      field :orderId do
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

    attribute(:addresses, :map)

    attribute(:company_name, :string)

    attribute(:created_at, :utc_datetime)

    attribute :currency, :atom do
      constraints(
        one_of: [
          :UNKNOWN_CURRENCY,
          :AED,
          :AFN,
          :ALL,
          :AMD,
          :ANG,
          :AOA,
          :ARS,
          :AUD,
          :AWG,
          :AZN,
          :BAM,
          :BBD,
          :BDT,
          :BGN,
          :BHD,
          :BIF,
          :BMD,
          :BND,
          :BOB,
          :BOV,
          :BRL,
          :BSD,
          :BTN,
          :BWP,
          :BYR,
          :BZD,
          :CAD,
          :CDF,
          :CHE,
          :CHF,
          :CHW,
          :CLF,
          :CLP,
          :CNY,
          :COP,
          :COU,
          :CRC,
          :CUC,
          :CUP,
          :CVE,
          :CZK,
          :DJF,
          :DKK,
          :DOP,
          :DZD,
          :EGP,
          :ERN,
          :ETB,
          :EUR,
          ...
        ]
      )
    end

    attribute(:emails, :map)

    attribute(:first_name, :string)

    attribute(:last_name, :string)

    attribute(:name, :string)

    attribute(:orders, :map)

    attribute(:phone_numbers, :map)

    attribute :status, :atom do
      constraints(one_of: [:active, :archived])
    end

    attribute(:updated_at, :utc_datetime)
  end
end