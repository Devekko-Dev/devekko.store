defmodule EcommerceApiDepartment do
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
    attribute(:code, :string)

    attribute(:created_at, :string)

    attribute(:created_by, :string)

    attribute(:description, :string)

    attribute(:id, :string)

    attribute(:name, :string)

    attribute(:parent_id, :string)

    attribute(:updated_at, :string)

    attribute(:updated_by, :string)
  end
end