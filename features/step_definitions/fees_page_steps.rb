When "I visit the fees page" do
  visit("/fees")
end

When "I change the fee to a new value" do
  fill_in "fee", with: 2
  click_on "Change fee"
end

Then "the new fee is confirmed" do
  expect(Fee.most_recent).to eq 2
  expect(page).to have_content("The current membership fee is")
  expect(page).to have_content("The fee has been updated")
end


When "I change the fee to a value below zero" do
  fill_in "fee", with: -5
  click_on "Change fee"
end

Then "the fee is denied" do
  expect(Fee.most_recent).to eq 0
  expect(page.body).to include "The current membership fee is"
  expect(page.body).to include "The fee has not been changed"

end
