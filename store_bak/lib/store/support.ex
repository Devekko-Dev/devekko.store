defmodule Store.Support do
  use Ash.Domain,
    otp_app: :store

  resources do
    resource Store.Support.Ticket
    resource Store.Support.Representative
  end
end
