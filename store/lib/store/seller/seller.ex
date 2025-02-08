defmodule Store.Seller.Seller do
  use Ash.Resource,
    otp_app: :store,
    domain: Store.Seller,
    extensions: [AshGraphql.Resource, AshJsonApi.Resource],
    data_layer: AshPostgres.DataLayer

  graphql do
    type(:seller)
  end

  json_api do
    type("seller")
  end

  postgres do
    table "sellers"
    repo Store.Repo
  end

  attributes do
    uuid_primary_key(:id)

    attribute :slug, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :first_name, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :last_name, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :street1, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :street2, :string do
      public?(true)
    end

    attribute :city, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :state, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :zip, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :country, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :notes, :string do
      public?(true)
    end

    attribute :x, :string do
      public?(true)
    end

    attribute :facebook, :string do
      public?(true)
    end

    attribute :instagram, :string do
      public?(true)
    end

    attribute :domain, :string do
      public?(true)
    end

    attribute :email, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :phone, :string do
      public?(true)
    end

    attribute :status, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :role, :string do
      allow_nil?(false)
      public?(true)
    end

    attribute :stripe_id, :string do
      allow_nil?(false)
      public?(true)
    end

    timestamps()
  end

  relationships do
    has_many :product, Store.Product.Product
  end

  actions do
    # defaults [:create, :read, :update, :destroy]
    default_accept([
      :slug,
      :first_name,
      :last_name,
      :street1,
      :street2,
      :city,
      :state,
      :zip,
      :country,
      :notes,
      :x,
      :facebook,
      :instagram,
      :domain,
      :email,
      :phone,
      :status,
      :role,
      :stripe_id
    ])

    create :create do
      accept([
        :slug,
        :first_name,
        :last_name,
        :street1,
        :street2,
        :city,
        :state,
        :zip,
        :country,
        :notes,
        :x,
        :facebook,
        :instagram,
        :domain,
        :email,
        :phone,
        :status,
        :role,
        :stripe_id
      ])
    end

    update :update do
      accept([
        :slug,
        :first_name,
        :last_name,
        :street1,
        :street2,
        :city,
        :state,
        :zip,
        :country,
        :notes,
        :x,
        :facebook,
        :instagram,
        :domain,
        :email,
        :phone,
        :status,
        :role,
        :stripe_id
      ])
    end

    read :read do
      primary?(true)
    end

    destroy :destroy do
    end
  end
end
