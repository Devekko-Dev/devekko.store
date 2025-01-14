defmodule EcommerceApiDepartment do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

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