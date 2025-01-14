defmodule EcommerceApiAddress do
  use Ash.Resource, domain: API.Gen.Ecommerce.Domain, data_layer: AshJsonApiWrapper.DataLayer

  actions do
  end

  attributes do
    attribute(:city, :string)

    attribute(:contact_name, :string)

    attribute(:country, :string)

    attribute(:county, :string)

    attribute(:email, :string)

    attribute(:fax, :string)

    attribute(:id, :string)

    attribute(:latitude, :string)

    attribute(:line1, :string)

    attribute(:line2, :string)

    attribute(:line3, :string)

    attribute(:line4, :string)

    attribute(:longitude, :string)

    attribute(:name, :string)

    attribute(:phone_number, :string)

    attribute(:postal_code, :string)

    attribute(:row_version, :string)

    attribute(:salutation, :string)

    attribute(:state, :string)

    attribute(:street_number, :string)

    attribute(:string, :string)

    attribute :type, :atom do
      constraints(one_of: [:primary, :secondary, :home, :office, :shipping, :billing, :other])
    end

    attribute(:website, :string)
  end
end