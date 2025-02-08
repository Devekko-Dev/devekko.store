Store.Seller.Seller
|> Ash.Changeset.for_create(:create, %{
slug: "slug",
first_name: "first_name",
last_name: "last_name",
street1: "street1",
street2: "street2",
city: "city",
state: "state",
zip: "zip",
country: "country",
notes: "notes",
x: "x",
facebook: "facebook",
instagram: "instagram",
domain: "domain",
email: "email",
phone: "phone",
status: "status",
role: "role",
stripe_id: "stripe_id"
})
|> Ash.create()


Store.Seller.create_seller(%{
slug: "slug1",
first_name: "first_name1",
last_name: "last_name1",
street1: "street11",
street2: "street21",
city: "city1",
state: "state1",
zip: "zip1",
country: "country1",
notes: "notes1",
x: "x1",
facebook: "facebook1",
instagram: "instagram1",
domain: "domain1",
email: "email1",
phone: "phone1",
status: "status1",
role: "role1",
stripe_id: "stripe_id1"
})

Store.Seller.read_sellers()

seller = Store.Seller.get_seller_by_id("3d557011-e2e5-4e8b-817c-e3c38678e144")
Store.Seller.update_seller(seller, %{slug: "slug1-updated"})


# broken? why
Store.Seller.update_seller(seller, %{slug: "slug1-update"})

{:ok, seller} = Store.Seller.get_seller_by_id("3d557011-e2e5-4e8b-817c-e3c38678e144")
Store.Seller.destroy_seller(seller)
