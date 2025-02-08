defmodule StoreWeb.SellerLive.Show do
  use StoreWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Seller {@seller.id}
      <:subtitle>This is a seller record from your database.</:subtitle>

      <:actions>
        <.link patch={~p"/sellers/#{@seller}/show/edit"} phx-click={JS.push_focus()}>
          <.button>Edit seller</.button>
        </.link>
      </:actions>
    </.header>

    <.list>
      <:item title="Id">{@seller.id}</:item>

      <:item title="Slug">{@seller.slug}</:item>

      <:item title="First name">{@seller.first_name}</:item>

      <:item title="Last name">{@seller.last_name}</:item>

      <:item title="Street1">{@seller.street1}</:item>

      <:item title="Street2">{@seller.street2}</:item>

      <:item title="City">{@seller.city}</:item>

      <:item title="State">{@seller.state}</:item>

      <:item title="Zip">{@seller.zip}</:item>

      <:item title="Country">{@seller.country}</:item>

      <:item title="Notes">{@seller.notes}</:item>

      <:item title="X">{@seller.x}</:item>

      <:item title="Facebook">{@seller.facebook}</:item>

      <:item title="Instagram">{@seller.instagram}</:item>

      <:item title="Domain">{@seller.domain}</:item>

      <:item title="Email">{@seller.email}</:item>

      <:item title="Phone">{@seller.phone}</:item>

      <:item title="Status">{@seller.status}</:item>

      <:item title="Role">{@seller.role}</:item>

      <:item title="Stripe">{@seller.stripe_id}</:item>
    </.list>

    <.back navigate={~p"/sellers"}>Back to sellers</.back>

    <.modal
      :if={@live_action == :edit}
      id="seller-modal"
      show
      on_cancel={JS.patch(~p"/sellers/#{@seller}")}
    >
      <.live_component
        module={StoreWeb.SellerLive.FormComponent}
        id={@seller.id}
        title={@page_title}
        action={@live_action}
        current_user={@current_user}
        seller={@seller}
        patch={~p"/sellers/#{@seller}"}
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

  # @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, socket}
  # end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:seller, Ash.get!(Store.Seller.Seller, id, actor: socket.assigns.current_user))}
    end

  defp page_title(:show), do: "Show Seller"
  defp page_title(:edit), do: "Edit Seller"
end
