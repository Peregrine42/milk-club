Given "members, payments and months are in the database" do
  richard = Member.create(name: "Richard")
  joe     = Member.create(name: "Joe")
  Member.create(name: "Duncan")

  richard.payments.create(amount: 1)
  joe.payments.create(amount: 1)

  DueTotal.create(amount: 1)
end

When "I visit the home page" do
  visit "/"
end

Then "I see the members who haven't paid" do
  expect(page).to have_no_content("Richard")
  expect(page).to have_no_content("Joe")
  expect(page).to have_content("Duncan")
end
