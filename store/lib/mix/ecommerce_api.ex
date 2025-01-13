defmodule API.Gen.Ecommerce do
  require IEx
  require Ash.Query
  # @moduletag :oapi_petstore
    use Ash.Domain,
      validate_config_inclusion?: false

      @petjson "test/ecommerceapi/pet_store.json" |> File.read!() |> Jason.decode!()
      @json "test/ecommerceapi/newecommerceapi.json" |> File.read!() |> Jason.decode!()
      @json_schema "test/ecommerceapi/newecommerceapi.json" |> File.read!() |> Jason.decode!() |> ExJsonSchema.Schema.resolve()


  defmodule Domain do
    use Ash.Domain,
      validate_config_inclusion?: false

    resources do
      allow_unregistered? true
    end
  end

  @config [
    tesla: TestingTesla,
    endpoint: "https://developers.apideck.com",
    resources: [
      EcommerceApiEcommerceStore:
      [
        path: "/ecommerce/stores/{id}",
        object_type: "components.schemas.EcommerceStore",
        primary_key: "id",
        # entity_path: "",
        fields: [
          orderId: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceOrder:
      [
        path: "/ecommerce/orders/{id}",
        object_type: "components.schemas.EcommerceOrder",
        primary_key: "id",
        # entity_path: "",
        fields: [
          orderId: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceCustomer:
      [
        path: "/ecommerce/customers/{id}",
        object_type: "components.schemas.EcommerceCustomer",
        primary_key: "id",
        # entity_path: "",
        fields: [
          orderId: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceProduct:
      [
        path: "/ecommerce/products/{id}",
        object_type: "components.schemas.EcommerceProduct",
        primary_key: "id",
        # entity_path: "",
        fields: [
          orderId: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ]
    ]
  ]

  def json do
    json_schema_resolved = @json_schema.schema
    json_resolved = json_schema_resolved |> Jason.encode!()
    # IO.puts(json_schema_resolved |> Jason.encode!())
    File.write!("priv/generated/ecommerce_api_schema.json", json_resolved)
  end

  def debug do
    json_schema_resolved = @json
    IO.inspect(json_schema_resolved)
    # File.write!("priv/generated/ecommerce_api_schema.json", json_resolved)
  end

  def debugcode do
    @json
  #   |> IO.inspect()
  #  IEx.pry()
    |> AshJsonApiWrapper.OpenApi.ResourceGenerator.generate(Domain, @config)
    # |> IO.inspect()
    |> Enum.map(fn {resource, code} ->
      IO.inspect(resource)
      IO.inspect(code)
      # IO.inspect(Code.eval_string(code))
      # Code.eval_string(code)
      # resource_down = to_string(resource) |> Macro.underscore()

      IO.inspect(resource)
     File.write!("priv/generated/#{resource}.ex", code)
    end)
  end

  def code do
    @json
    |> AshJsonApiWrapper.OpenApi.ResourceGenerator.generate(Domain, @config)
    |> Enum.map(fn {resource, code} ->
      Code.eval_string(code)
      resource_down = to_string(resource) |> Macro.underscore()
      File.write!("priv/generated/#{resource_down}.ex", code)
    end)
  end

end
