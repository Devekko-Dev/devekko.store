# https://goessner.net/articles/JsonPath/
{:ok, json} = File.read("test/ecommerceapi/newecommerceapi.json")
{:ok, store} = Jason.decode(json)
ExJSONPath.eval(store, "$.paths.*")
ExJSONPath.eval(store, "$.paths..operationId")
ExJSONPath.eval(store, "$.paths..description")

ExJSONPath.eval(store, "$.components..schemas")
