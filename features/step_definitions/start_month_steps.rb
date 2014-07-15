Given "the system's database is populated" do
  Fee.create(amount: 1)

  Member.create(name: "Richard", ein:'5', role:'Admin')
  Member.create(name: "Joe", ein:'6', role:'User')
  Member.create(name: "Duncan", ein:'7', role:'User')
end

When "I visit the new amount due page" do
  visit("/new_amount_due")
end

When "I click the add amount due button" do
  click_button "Add new amount due"
end

Then "everyone should owe at least the amount added" do
  expect(Member.find_by(name: "Richard").balance).to eq(-Fee.most_recent)
  expect(Member.find_by(name: "Joe").balance).to     eq(-Fee.most_recent)
  expect(Member.find_by(name: "Duncan").balance).to  eq(-Fee.most_recent)
end
