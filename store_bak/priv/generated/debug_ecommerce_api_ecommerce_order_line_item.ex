defmodule EcommerceApiEcommerceOrderLineItem do
  use Ash.Resource,
    domain: API.Gen.Ecommerce.Domain,
    extensions: [
      AshAdmin.Resource,
      AshJsonApi.Resource,
      AshGraphql.Resource,
      AshSlug
    ]

  resource do
    require_primary_key?(false)
  end

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