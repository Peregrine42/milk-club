When  "I click the total expenses navbar link" do
  click_on("Total Expenses")
end

Then  "I see the total balance for the month" do
  page.should have_content("2")
end

Then  "I see the expected balance for the month" do
  page.should have_content("3")
end
