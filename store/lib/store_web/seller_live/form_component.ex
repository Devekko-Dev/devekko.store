defmodule StoreWeb.SellerLive.FormComponent do
  use StoreWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage seller records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="seller-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <%= if @form.source.type == :create do %>
          <.input field={@form[:slug]} type="text" label="Slug" /><.input
            field={@form[:first_name]}
            type="text"
            label="First name"
          /><.input field={@form[:last_name]} type="text" label="Last name" /><.input
            field={@form[:street1]}
            type="text"
            label="Street1"
          /><.input field={@form[:street2]} type="text" label="Street2" /><.input
            field={@form[:city]}
            type="text"
            label="City"
          /><.input field={@form[:state]} type="text" label="State" /><.input
            field={@form[:zip]}
            type="text"
            label="Zip"
          /><.input field={@form[:country]} type="text" label="Country" /><.input
            field={@form[:notes]}
            type="text"
            label="Notes"
          /><.input field={@form[:x]} type="text" label="X" /><.input
            field={@form[:facebook]}
            type="text"
            label="Facebook"
          /><.input field={@form[:instagram]} type="text" label="Instagram" /><.input
            field={@form[:domain]}
            type="text"
            label="Domain"
          /><.input field={@form[:email]} type="text" label="Email" /><.input
            field={@form[:phone]}
            type="text"
            label="Phone"
          /><.input field={@form[:status]} type="text" label="Status" /><.input
            field={@form[:role]}
            type="text"
            label="Role"
          /><.input field={@form[:stripe_id]} type="text" label="Stripe" />
        <% end %>
        <%= if @form.source.type == :update do %>
          <.input field={@form[:slug]} type="text" label="Slug" />
        <% end %>

        <:actions>
          <.button phx-disable-with="Saving...">Save Seller</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_form()}
  end

  @impl true
  def handle_event("validate", %{"seller" => seller_params}, socket) do
    {:noreply, assign(socket, form: AshPhoenix.Form.validate(socket.assigns.form, seller_params))}
  end

  def handle_event("save", %{"seller" => seller_params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form, params: seller_params) do
      {:ok, seller} ->
        notify_parent({:saved, seller})

        socket =
          socket
          |> put_flash(:info, "Seller #{socket.assigns.form.source.type}d successfully")
          |> push_patch(to: socket.assigns.patch)

        {:noreply, socket}

      {:error, form} ->
        {:noreply, assign(socket, form: form)}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp assign_form(%{assigns: %{seller: seller}} = socket) do
    form =
      if seller do
        AshPhoenix.Form.for_update(seller, :update,
          as: "seller",
          actor: socket.assigns.current_user
        )
      else
        AshPhoenix.Form.for_create(Store.Seller.Seller, :create,
          as: "seller",
          actor: socket.assigns.current_user
        )
      end

    assign(socket, form: to_form(form))
  end
end
