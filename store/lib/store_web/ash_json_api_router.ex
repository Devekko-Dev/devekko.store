defmodule StoreWeb.AshJsonApiRouter do
  use AshJsonApi.Router,
    domains: [Module.concat(["Store.Product"])],
    open_api: "/open_api"
end
