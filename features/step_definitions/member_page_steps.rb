When "I visit the members page" do
  visit '/members'
end

Then "I should see my payment history" do
  expect(page.body).to match("Balance: £3")
end
