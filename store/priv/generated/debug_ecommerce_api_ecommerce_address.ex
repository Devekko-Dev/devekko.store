defmodule EcommerceApiEcommerceAddress do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:city, :string)

    attribute(:company_name, :string)

    attribute :country, :string do
      constraints(max_length: 2)
    end

    attribute(:line1, :string)

    attribute(:line2, :string)

    attribute(:postal_code, :string)

    attribute(:state, :string)
  end
end