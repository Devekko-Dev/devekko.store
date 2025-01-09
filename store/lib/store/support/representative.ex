defmodule Store.Support.Representative do
  use Ash.Resource, otp_app: :store, domain: Store.Support, data_layer: AshPostgres.DataLayer

  postgres do
    table "representatives"
    repo Store.Repo
  end

  actions do
    defaults [:read, create: [:name]]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end
  end

  relationships do
    has_many :tickets, Store.Support.Ticket do
      public? true
    end
  end
end
