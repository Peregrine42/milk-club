Given "members, payments and dues are in the database" do
  richard = Member.create(name: "Richard", ein:'5', role:'Admin')
  joe     = Member.create(name: "Joe", ein:'6', role:'User')
  duncan  = Member.create(name: "Duncan", ein:'7', role:'User')

  richard.dues.create(amount: 1)
  joe.dues.create(amount: 1)
  duncan.dues.create(amount: 1)

  richard.payments.create(amount: 1)
  joe.payments.create(amount: 1)
end

When "I visit the home page" do
  visit "/"
end

Then "I see the balance for the members" do
  expect(page).to have_content("Richard")
  expect(page).to have_content("Joe")
  expect(page).to have_content("Duncan")
end
