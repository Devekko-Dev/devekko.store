


mix ash.gen.domain Store.Admin
mix ash.gen.domain Store.Customer
mix ash.gen.domain Store.Store
mix ash.gen.domain Store.Catalog
mix ash.gen.domain Store.Product
mix ash.gen.domain Store.Cart
mix ash.gen.domain Store.Order
mix ash.gen.domain Store.Shipping
mix ash.gen.domain Store.Inventory
mix ash.gen.domain Store.Payment

mix ash.gen.domain Store.Seller

mix ash.gen.resource Store.Seller.Seller \
  --default-actions read \
  --uuid-primary-key id \
  --attribute slug:string:required:public \
  --attribute first_name:string:required:public \
  --attribute last_name:string:required:public \
  --attribute street1:string:required:public \
  --attribute street2:string:public \
  --attribute city:string:required:public \
  --attribute state:string:required:public \
  --attribute zip:string:required:public \
  --attribute country:string:required:public \
  --attribute notes:string:public \
  --attribute x:string:public \
  --attribute facebook:string:public \
  --attribute instagram:string:public \
  --attribute domain:string:public \
  --attribute email:string:required:public \
  --attribute phone:string:public \
  --attribute status:string:required:public \
  --attribute role:string:required:public \
  --attribute stripe_id:string:required:public \
  --relationship has_many:product:Store.Product.Product \
  --timestamps \
  --extend postgres,graphql,json_api

mix ash.gen.domain Store.Admin

mix ash.gen.resource Store.Admin.Admin \
  --default-actions read \
  --uuid-primary-key id \
  --attribute slug:string:required:public \
  --attribute first_name:string:required:public \
  --attribute last_name:string:required:public \
  --attribute street1:string:required:public \
  --attribute street2:string:required:public \
  --attribute city:string:required:public \
  --attribute state:string:required:public \
  --attribute zip:string:required:public \
  --attribute country:string:required:public \
  --attribute notes:string:required:public \
  --attribute x:string:required:public \
  --attribute facebook:string:required:public \
  --attribute instagram:string:required:public \
  --attribute domain:string:required:public \
  --attribute email:string:required:public \
  --attribute phone:string:required:public \
  --attribute status:string:required:public \
  --attribute role:string:required:public \
  --relationship has_many:store:Store.Store.Store \
  --timestamps \
  --extend postgres,graphql,json


mix ash.gen.domain Store.Customer

mix ash.gen.resource Store.Customer.Customer \
  --default-actions read \
  --uuid-primary-key id \
  --attribute slug:string:required:public \
  --attribute first_name:string:required:public \
  --attribute last_name:string:required:public \
  --attribute street1:string:required:public \
  --attribute street2:string:required:public \
  --attribute city:string:required:public \
  --attribute state:string:required:public \
  --attribute zip:string:required:public \
  --attribute country:string:required:public \
  --attribute notes:string:required:public \
  --attribute x:string:required:public \
  --attribute facebook:string:required:public \
  --attribute instagram:string:required:public \
  --attribute domain:string:required:public \
  --attribute email:string:required:public \
  --attribute phone:string:required:public \
  --attribute status:string:required:public \
  --relationship belongs_to:store:Store.Store.Store \
  --relationship has_many:cart:Store.Cart.Cart \
  --relationship has_many:order:Store.Order.Order \
  --relationship has_many:shipment:Store.Shipping.Shipment \
  --relationship has_many:method:Store.Payment.Method \
  --timestamps \
  --extend postgres,graphql,json

mix ash.gen.domain Store.Store

mix ash.gen.resource Store.Store.Store \
  --default-actions read \
  --uuid-primary-key id \
  --attribute name:string:required:public \
  --attribute slug:string:required:public \
  --attribute subtitle:string:required:public \
  --attribute description:string:required:public \
  --attribute about:string:required:public \
  --attribute contact:string:required:public \
  --attribute team:string:required:public \
  --attribute work:string:required:public \
  --attribute recommendations:string:required:public \
  --attribute x:string:required:public \
  --attribute facebook:string:required:public \
  --attribute instagram:string:required:public \
  --attribute domain:string:required:public \
  --attribute email:string:required:public \
  --attribute phone:string:required:public \
  --attribute location:string:required:public \
  --relationship belongs_to:account:Store.Account.Account \
  --relationship belongs_to:account:Store.Account.User \
  --relationship has_many:collection:Store.Customer.Customer \
  --relationship has_many:collection:Store.Catalog.Collection \
  --relationship has_many:collection:Store.Product.Product \
  --relationship has_many:collection:Store.Cart.Cart \
  --relationship has_many:collection:Store.Order.Order \
  --relationship has_many:collection:Store.Shipping.Shipment \
  --relationship has_many:collection:Store.Inventory.Warehouse \
  --timestamps \
  --extend postgres,graphql,json

mix ash.gen.resource Store.Products.Product \
  --default-actions read \
  --uuid-primary-key id \
  --attribute sku:string:required:public \
  --attribute name:string:required:public \
  --attribute slug:string:required:public \
  --attribute subtitle:string:required:public \
  --attribute description:string:required:public \
  --attribute featured_image:string:required:public \
  --attribute images:map:required:public \
  --attribute featured:boolean:required:public \
  --attribute order:number:required:public \
  --attribute stripe_id:string:required:public \
  --relationship belongs_to:account:Store.Catalog.Collection \
  --relationship belongs_to:account:Store.Accounts.Account \
  --relationship belongs_to:account:Store.Accounts.User \
  --timestamps \
  --extend postgres,graphql,json

mix ash.gen.resource Store.Catalogs.Collection \
  --default-actions read \
  --uuid-primary-key id \
  --attribute name:string:required:public \
  --attribute slug:string:required:public \
  --attribute subtitle:string:required:public \
  --attribute description:string:required:public \
  --attribute featured_image:string:required:public \
  --attribute images:map:required:public \
  --attribute featured:boolean:required:public \
  --attribute order:number:required:public \
  --relationship belongs_to:account:Store.Stores.Store \
  --relationship belongs_to:account:Store.Accounts.Account \
  --relationship belongs_to:account:Store.Accounts.User \
  --relationship has_many:product:Store.Catalogs.Product \
  --timestamps \
  --extend postgres,graphql,json



Inspiration

https://github.com/puemos/microcraft

defmodule Store.Repo do
  use Ecto.Repo,
    otp_app: :store,
    adapter: Ecto.Adapters.Postgres
end
