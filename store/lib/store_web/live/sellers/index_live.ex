defmodule StoreWeb.SellerLive do
  use StoreWeb, :live_view

  def render(assigns) do
    ~H"""
    Hello Sellers!
    <.table
      id="sellers"
      rows={@streams.sellers}
      row_id={fn {dom_id, _} -> dom_id end}
    >
    <:empty>
      <div class="block py-4 pr-6">
        <span class={["relative"]}>
          No seller found
        </span>
      </div>
    </:empty>
    <:col :let={{_, seller}} label="slug">{seller.slug}</:col>
    <:col :let={{_, seller}} label="first_name">
        {seller.first_name}
    </:col>
    <:col :let={{_, seller}} label="last_name">
        {seller.last_name}
    </:col>
    </.table>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, sellers} = Store.Seller.read_sellers()
    # IO.inspect(sellers)
    {:ok, stream(socket, :sellers, sellers)}
  end

end


# sellers
    # <li :for={seller <- @sellers}>
    # seller.slug
    # </li>
