defmodule EcommerceApiTrackingItem do
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
    attribute(:number, :string)

    attribute(:provider, :string)

    attribute(:updated_at, :string)

    attribute(:url, :string)
  end
end