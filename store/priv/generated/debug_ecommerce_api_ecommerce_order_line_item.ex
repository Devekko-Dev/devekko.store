defmodule EcommerceApiEcommerceOrderLineItem do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:description, :string)

    attribute(:discounts, :map)

    attribute(:id, :string)

    attribute(:name, :string)

    attribute(:options, :map)

    attribute(:product_id, :string)

    attribute(:quantity, :string)

    attribute(:sku, :string)

    attribute(:tax_amount, :string)

    attribute(:tax_rate, :string)

    attribute(:total_amount, :string)

    attribute(:unit_price, :string)

    attribute(:variant_id, :string)
  end
end