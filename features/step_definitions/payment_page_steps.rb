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
  expect(page).to have_button("add payments")
  click_button "add payments"
end

Then "the member should have a new payment" do
  expect(Member.find_by(name: "Richard").payments.last.amount).to eq 3
end

Then "the member should have a negative amount due equal to the current amount to be paid" do
  expect(Member.find_by(name: "Richard").dues.last.amount).to eq(-1)
end
