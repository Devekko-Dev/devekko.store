defmodule EcommerceApiWebsite do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:id, :string)

    attribute :type, :atom do
      constraints(one_of: [:primary, :secondary, :work, :personal, :other])
    end

    attribute :url, :string do
      constraints(min_length: 1)
    end
  end
end