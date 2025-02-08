defmodule StoreWeb.SellerLive.Index do
  use StoreWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Sellers
      <:actions>
        <.link patch={~p"/sellers/new"}>
          <.button>New Seller</.button>
        </.link>
      </:actions>
    </.header>

    <.table
      id="sellers"
      rows={@streams.sellers}
      row_click={fn {_id, seller} -> JS.navigate(~p"/sellers/#{seller}") end}
    >
      <:col :let={{_id, seller}} label="Id">{seller.id}</:col>

      <:col :let={{_id, seller}} label="Slug">{seller.slug}</:col>

      <:col :let={{_id, seller}} label="First name">{seller.first_name}</:col>

      <:col :let={{_id, seller}} label="Last name">{seller.last_name}</:col>

      <:col :let={{_id, seller}} label="Street1">{seller.street1}</:col>

      <:col :let={{_id, seller}} label="Street2">{seller.street2}</:col>

      <:col :let={{_id, seller}} label="City">{seller.city}</:col>

      <:col :let={{_id, seller}} label="State">{seller.state}</:col>

      <:col :let={{_id, seller}} label="Zip">{seller.zip}</:col>

      <:col :let={{_id, seller}} label="Country">{seller.country}</:col>

      <:col :let={{_id, seller}} label="Notes">{seller.notes}</:col>

      <:col :let={{_id, seller}} label="X">{seller.x}</:col>

      <:col :let={{_id, seller}} label="Facebook">{seller.facebook}</:col>

      <:col :let={{_id, seller}} label="Instagram">{seller.instagram}</:col>

      <:col :let={{_id, seller}} label="Domain">{seller.domain}</:col>

      <:col :let={{_id, seller}} label="Email">{seller.email}</:col>

      <:col :let={{_id, seller}} label="Phone">{seller.phone}</:col>

      <:col :let={{_id, seller}} label="Status">{seller.status}</:col>

      <:col :let={{_id, seller}} label="Role">{seller.role}</:col>

      <:col :let={{_id, seller}} label="Stripe">{seller.stripe_id}</:col>

      <:action :let={{_id, seller}}>
        <div class="sr-only">
          <.link navigate={~p"/sellers/#{seller}"}>Show</.link>
        </div>

        <.link patch={~p"/sellers/#{seller}/edit"}>Edit</.link>
      </:action>

      <:action :let={{id, seller}}>
        <.link
          phx-click={JS.push("delete", value: %{id: seller.id}) |> hide("##{id}")}
          data-confirm="Are you sure?"
        >
          Delete
        </.link>
      </:action>
    </.table>

    <.modal
      :if={@live_action in [:new, :edit]}
      id="seller-modal"
      show
      on_cancel={JS.patch(~p"/sellers")}
    >
      <.live_component
        module={StoreWeb.SellerLive.FormComponent}
        id={(@seller && @seller.id) || :new}
        title={@page_title}
        current_user={@current_user}
        action={@live_action}
        seller={@seller}
        patch={~p"/sellers"}
      />
    </.modal>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> stream(:sellers, Ash.read!(Store.Seller.Seller, actor: socket.assigns[:current_user]))
     |> assign_new(:current_user, fn -> nil end)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Seller")
    |> assign(:seller, Ash.get!(Store.Seller.Seller, id, actor: socket.assigns.current_user))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Seller")
    |> assign(:seller, nil)
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Sellers")
    |> assign(:seller, nil)
  end

  @impl true
  def handle_info({StoreWeb.SellerLive.FormComponent, {:saved, seller}}, socket) do
    {:noreply, stream_insert(socket, :sellers, seller)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    seller = Ash.get!(Store.Seller.Seller, id, actor: socket.assigns.current_user)
    Ash.destroy!(seller, actor: socket.assigns.current_user)

    {:noreply, stream_delete(socket, :sellers, seller)}
  end
end
