When "I visit the payment page" do
  visit '/payments'
end

Then "I see all the members" do
  expect(page).to have_content("Richard")
  expect(page).to have_content("Joe")
  expect(page).to have_content("Duncan")
end

When "I enter the amount that has been payed by a member" do
  fill_in "amount[#{Member.find_by(name: "Richard").id}]", with: 3
end

When "I click the add button" do
  expect(page).to have_button("add payments")
  click_button "add payments"
end

Then "the member should have a new payment" do
  expect(Member.find_by(name: "Richard").payments.last.amount).to eq 3
end
