defmodule Store.Product.Product do
  use Ash.Resource,
    otp_app: :store,
    domain: Store.Product,
    extensions: [AshGraphql.Resource, AshJsonApi.Resource, AshAdmin.Resource],
    data_layer: AshPostgres.DataLayer

  graphql do
    type(:product)
  end

  json_api do
    type("product")
  end

  postgres do
    table "products"
    repo Store.Repo
  end

  attributes do
    uuid_primary_key(:id)
    attribute :sku, :string do allow_nil?(false) public?(true) end
    attribute :name, :string do allow_nil?(false) public?(true) end
    attribute :slug, :string do allow_nil?(false) public?(true) end
    attribute :subtitle, :string do public?(true) end
    attribute :description, :string do allow_nil?(false) public?(true) end
    attribute :featured_image, :string do allow_nil?(false) public?(true) end
    attribute :images, :map do public?(true) end
    attribute :featured, :boolean do allow_nil?(false) public?(true) end
    attribute :order, :integer do public?(true) end
    attribute :stripe_id, :string do allow_nil?(false) public?(true) end
    attribute :price, :decimal do allow_nil?(false) public?(true) end
    timestamps()
  end

  relationships do
    belongs_to :seller, Store.Seller.Seller
  end

  actions do
    # defaults [:create, :read, :update, :destroy]
    default_accept([
      :sku,
      :name,
      :slug,
      :subtitle,
      :description,
      :featured_image,
      :images,
      :featured,
      :order,
      :stripe_id,
      :price
    ])

    create :create do
      accept([
        :sku,
        :name,
        :slug,
        :subtitle,
        :description,
        :featured_image,
        :images,
        :featured,
        :order,
        :stripe_id,
        :price
      ])
    end

    update :update do
      accept([
        :sku,
        :name,
        :slug,
        :subtitle,
        :description,
        :featured_image,
        :images,
        :featured,
        :order,
        :stripe_id,
        :price
      ])
    end

    read :read do
      primary?(true)
    end

    destroy :destroy do
    end
  end
end
