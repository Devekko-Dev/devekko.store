defmodule EcommerceApiEcommerceDiscount do
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
    attribute(:amount, :string)

    attribute(:code, :string)

    attribute(:percentage, :string)
  end
end