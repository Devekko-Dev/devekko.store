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