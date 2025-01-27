
ash_slug = "AshSlug"
ash_json = "AshJsonApi.Resource"
ash_graphql = "AshGraphql.Resource"
ash_admin = "AshAdmin.Resource"
ash_ext_list = "[ #{ash_slug <> "," <> ash_json <> "," <> ash_graphql <> "," <> ash_admin} ]"
l = "[ AshSlug,AshJsonApi.Resource,AshGraphql.Resource,AshAdmin.Resource ]"
lst = ["hello", "educative", "answers"]
ash_extensions = "extensions: [ #{ash_slug <> "," <> ash_json <> "," <> ash_graphql <> "," <> ash_admin} ]"
joiner = " -- "
ash_extender = Enum.join(ash_ext_list, joiner)


defmodule CommaSeparatedList do
  def create_list(var1, var2, var3) do
    list = for var <- [var1, var2, var3], var != nil, do: var
    Enum.join(list, ", ")
  end
end

{inspect(create_list(ash_slug, ash_json, ash_graphql, ash_admin))}
