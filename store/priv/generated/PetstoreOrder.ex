defmodule PetstoreOrder do
  use Ash.Resource, domain: Petstore.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    endpoints do
      base("https://petstore3.swagger.io/api/v3")

      endpoint :get_order_by_id do
        path("/store/order/{orderId}")
      end
    end

    fields do
      field :orderId do
        filter_handler({:place_in_csv_list, ["id"]})
      end
    end
  end

  actions do
    read(:get_order_by_id)
  end

  attributes do
    attribute :id, :integer do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:complete, :boolean)

    attribute(:pet_id, :integer)

    attribute(:quantity, :integer)

    attribute(:ship_date, :utc_datetime)

    attribute :status, :atom do
      constraints(one_of: [:placed, :approved, :delivered])
    end
  end
end