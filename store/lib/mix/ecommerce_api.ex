defmodule API.Gen.Ecommerce do
  # require IEx
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
      # schemas
      EcommerceApiAddress:
      [
        path: "__schema__",
        object_type: "components.schemas.Address",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiDepartment:
      [
        path: "__schema__",
        object_type: "components.schemas.Department",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      # EcommerceApiDivision:
      # [
      #   path: "__schema__",
      #   object_type: "components.schemas.Division",
      #   primary_key: "",
      #   # entity_path: "",
      #   fields: [
      #     id: [
      #       filter_handler: {:place_in_csv_list, ["id"]}
      #     ]
      #   ]
      # ],
      EcommerceApiEcommerceAddress:
      [
        path: "__schema__",
        object_type: "components.schemas.EcommerceAddress",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceCustomer:
      [
        path: "__schema__",
        object_type: "components.schemas.EcommerceCustomer",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceDiscount:
      [
        path: "__schema__",
        object_type: "components.schemas.EcommerceDiscount",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiEcommerceOrderLineItem:
      [
        path: "__schema__",
        object_type: "components.schemas.EcommerceOrderLineItem",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiTrackingItem:
      [
        path: "__schema__",
        object_type: "components.schemas.TrackingItem",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      EcommerceApiWebsite:
      [
        path: "__schema__",
        object_type: "components.schemas.Website",
        primary_key: "",
        # entity_path: "",
        fields: [
          id: [
            filter_handler: {:place_in_csv_list, ["id"]}
          ]
        ]
      ],
      # broken
      # EcommerceApiEcommerceOrderStatus:
      # [
      #   path: "__schema__",
      #   object_type: "components.schemas.EcommerceOrderStatus",
      #   primary_key: "",
      #   # entity_path: "",
      #   fields: [
      #     id: [
      #       filter_handler: {:place_in_csv_list, ["id"]}
      #     ]
      #   ]
      # ],
      # broken
      # EcommerceApiEcommerceOrdersFilter:
      # [
      #   path: "__schema__",
      #   object_type: "components.schemas.EcommerceOrdersFilter",
      #   primary_key: "",
      #   # entity_path: "",
      #   fields: [
      #     id: [
      #       filter_handler: {:place_in_csv_list, ["id"]}
      #     ]
      #   ]
      # ],
      # broken
      # EcommerceApiPaymentUnit:
      # [
      #   path: "__schema__",
      #   object_type: "components.schemas.PaymentUnit",
      #   primary_key: "id",
      #   fields: [
      #     id: [
      #       filter_handler: {:place_in_csv_list, ["id"]}
      #     ]
      #   ]
      # ],
      # paths
      EcommerceApiEcommerceStore:
      [
        path: "/ecommerce/store",
        object_type: "components.schemas.EcommerceStore",
        primary_key: "id",
        # entity_path: "",
        fields: [
          id: [
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
          id: [
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
          id: [
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
          id: [
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
      # IO.inspect(resource)
      # IO.inspect(code)
      # IO.inspect(Code.eval_string(code))
      # Code.eval_string(code)
      resource_down = to_string(resource) |> Macro.underscore()

      IO.inspect(resource_down)
     File.write!("priv/generated/debug_#{resource_down}.ex", code)
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
