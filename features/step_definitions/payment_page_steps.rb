Given "an amount due for the month is in the database" do
  Fee.create(amount: 1)
end

When "I visit the payment page" do
  visit '/payments'
end

Then "I see all the members" do
  expect(page).to have_content("Richard")
  expect(page).to have_content("Joe")
  expect(page).to have_content("Duncan")
end

When "I enter the amount that has been payed by a member" do
  fill_in "payment[#{Member.find_by(name: "Richard").id}][amount]", with: 3
end

When "I check the skip payment box" do
  check "payment[#{Member.find_by(name: "Richard").id}][skipped]"
end

When "I click the add button" do
  click_button "Add payments"
end

Then "the member should have a new payment" do
  expect(Member.find_by(name: "Richard").payments.last.amount).to eq 3
end

Then  "the member should have no payment due for that month" do
  expect(Member.find_by(name: "Richard").dues.last.amount).to eq(0)
end
