mix archive.install hex phx_new

erlang 27.1.2
elixir 1.18.0-otp-27

mix igniter.new store \
  --install ash,ash_postgres,ash_phoenix \
  --with phx.new \
  --extend postgres \
  --example


git subtree add --prefix commerce https://github.com/Devekko-Dev/commerce.git main --squash

mix ash.gen.domain Store.Products

mix ash.gen.resource Store.Products.Product \
  --default-actions read \
  --uuid-primary-key id \
  --attribute description:string:required:public, \
  --relationship belongs_to:collection:Store.Collections.Collection \
  --timestamps \
  --extend postgres,graphql



 docker compose up cuda
 docker compose up store_ollama


 sh <(curl 'https://ash-hq.org/new/store?install=phoenix') \
    && cd store && mix igniter.install ash_phoenix \
    ash_graphql ash_json_api ash_postgres ash_sqlite \
    ash_authentication ash_authentication_phoenix ash_money \
    ash_csv ash_admin ash_oban ash_state_machine \
    ash_double_entry ash_archival ash_paper_trail cloak \
    ash_cloak --auth-strategy password \
    --auth-strategy magic_link --yes && mix ash.setup


mix igniter.install ash_postgres

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

mix phx.gen.live Store.Seller Seller sellers slug:string first_name:string last_name:string email:string

mix ash.gen.resource Store.Product.Product \
  --default-actions read \
  --uuid-primary-key id \
  --attribute sku:string:required:public \
  --attribute name:string:required:public \
  --attribute slug:string:required:public \
  --attribute subtitle:string:public \
  --attribute description:string:required:public \
  --attribute featured_image:string:required:public \
  --attribute images:map:public \
  --attribute featured:boolean:required:public \
  --attribute order:integer:public \
  --attribute stripe_id:string:required:public \
  --attribute price:decimal:required:public \
  --relationship belongs_to:seller:Store.Seller.Seller \
  --timestamps \
  --extend postgres,graphql,json_api,AshAdmin.Resource

mix ash.codegen create_seller_product

mix ash_phoenix.gen.live --domain Store.Seller --resource Store.Seller.Seller --resourceplural sellers

why so many questions? 
too many options
too many steps
book doesnt have complete liveview forms
I want to be able to see the code
I dont want the frustration and the time of working backwards from cut off snippets, docs, examples online that dont align and trial and error
I want a book that is cohesive and whole

mix igniter.install ash_authentication



mix ash_authentication.add_strategy password



## Simple alerts
> [!NOTE]
> This is a note.

> [!TIP]
> This is a tip. (Supported since 14 Nov 2023)

> [!IMPORTANT]
> Crutial information comes here.

> [!CAUTION]
> Negative potential consequences of an action. (Supported since 14 Nov 2023)

> [!WARNING]
> Critical content comes here.