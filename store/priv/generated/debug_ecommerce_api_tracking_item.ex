defmodule EcommerceApiTrackingItem do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:number, :string)

    attribute(:provider, :string)

    attribute(:updated_at, :string)

    attribute(:url, :string)
  end
end