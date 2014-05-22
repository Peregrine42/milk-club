Given "my payment history is in the database" do
  me = Member.find_by(ein: 'good ein')
  me.payments.create(amount: 5)
  me.dues.create(amount: 2)
end

When "I visit the my account page" do
  visit '/my_account'
end

Then "I should see my payment history" do
  expect(page.body).to match("Balance: £3")
end
