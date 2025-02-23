defmodule Store do
  @moduledoc """
  Store keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @type uuid :: Ecto.UUID.t()
end
