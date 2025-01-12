defmodule Mix.Tasks.EcommerceGen do
  @moduledoc "The Ecommerce API mix task: `mix ecommerce_gen`"
  use Mix.Task

  @shortdoc "Gen Ecommerce API Resource."
  def run(_) do
    # API.Gen.Ecommerce.json()
    API.Gen.Ecommerce.debug()
  end
end
