Given "the system's database is populated" do
  Fee.create(amount: 1)

  Member.create(name: "Richard")
  Member.create(name: "Rupert")
  Member.create(name: "Duncan")
end

When "I visit the new amount due page" do
  visit("/new_amount_due")
end

When "I click the add amount due button" do
  click_button "add new amount due"
end

Then "everyone should owe at least the amount added" do
  Member.find_by(name: "Richard").owes Fee.most_recent
  Member.find_by(name: "Rupert").owes  Fee.most_recent
  Member.find_by(name: "Duncan").owes  Fee.most_recent
end
