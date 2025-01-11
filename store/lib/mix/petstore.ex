defmodule Petstore do
  require Ash.Query
  # @moduletag :oapi_petstore
    use Ash.Domain,
      validate_config_inclusion?: false


  defmodule Domain do
    use Ash.Domain,
      validate_config_inclusion?: false

    resources do
      allow_unregistered? true
    end
  end

  @config [
    tesla: TestingTesla,
    endpoint: "https://petstore3.swagger.io/api/v3",
    resources: [
      PetstoreOrder:
      [
        path: "/store/order/{orderId}",
        object_type: "components.schemas.Order",
        primary_key: "id",
        # entity_path: "",
        fields: [
          orderId: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      PetstoreUser:
      [
        path: "/store/user/{userId}",
        object_type: "components.schemas.User",
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


  # @config [
  #   tesla: TestingTesla,
  #   endpoint: "https://petstore3.swagger.io/api/v3",
  #   resources: [
  #     PetstoreUser:
  #     [
  #       path: "/store/user/{userId}",
  #       object_type: "components.schemas.User",
  #       primary_key: "id",
  #       # entity_path: "",
  #       fields: [
  #         orderId: [
  #           filter_handler: {:place_in_csv_list, ["id"]}
  #         ]
  #       ]
  #     ]
  #   ]
  # ]

  @json "test/ecommerceapi/pet_store.json" |> File.read!() |> Jason.decode!()

  @doc """
  Outputs `Hello, World!` every time.
  """
  def say do
    IO.puts("Hello, Petstore!")
  end

  def json do
    IO.puts(@json)
  end

  def debug do
    @json
    |> AshJsonApiWrapper.OpenApi.ResourceGenerator.generate(Domain, @config)
    |> IO.inspect()
    |> Enum.map(fn {resource, code} ->
      IO.inspect(resource)
      IO.inspect(code)
      Code.eval_string(code)
      # resource
      File.write!("priv/generated/petstore.ex", code)
    end)
  end

  def code do
    @json
    |> AshJsonApiWrapper.OpenApi.ResourceGenerator.generate(Domain, @config)
    |> Enum.map(fn {resource, code} ->
      Code.eval_string(code)
      resource
      IO.inspect(resource)
      IO.inspect(code)
      File.write!("priv/generated/#{resource}.ex", code)

    end)
  end

end
