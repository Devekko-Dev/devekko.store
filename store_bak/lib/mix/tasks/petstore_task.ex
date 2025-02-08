defmodule Mix.Tasks.Petstore do
  @moduledoc "The hello mix task: `mix help hello`"
  use Mix.Task

  @shortdoc "Simply calls the Hello.say/0 function."
  def run(_) do
    # calling our Hello.say() function from earlier
    # Petstore.say()
    # Petstore.json()
    # Petstore.debug()
    Petstore.debug()
    #    Petstore.generate()
  end
end
