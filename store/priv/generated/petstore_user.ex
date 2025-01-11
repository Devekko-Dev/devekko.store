defmodule PetstoreUser do
  use Ash.Resource, domain: Petstore.Domain, data_layer: AshJsonApiWrapper.DataLayer

  json_api_wrapper do
    tesla(Elixir.TestingTesla)

    endpoints do
      base("https://petstore3.swagger.io/api/v3")
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
    attribute :id, :integer do
      primary_key?(true)
      allow_nil?(false)
    end

    attribute(:email, :string)

    attribute(:first_name, :string)

    attribute(:last_name, :string)

    attribute(:password, :string)

    attribute(:phone, :string)

    attribute(:user_status, :integer)

    attribute(:username, :string)
  end
end