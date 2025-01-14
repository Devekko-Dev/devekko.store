defmodule EcommerceApiEcommerceDiscount do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:amount, :string)

    attribute(:code, :string)

    attribute(:percentage, :string)
  end
end