# lib/helpdesk/support.ex

defmodule Store.Admin do
  use Ash.Domain

  resources do
    resource Store.Admin.Product
  end
end