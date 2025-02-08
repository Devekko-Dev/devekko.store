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

mix igniter.install ash_authentication

