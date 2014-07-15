When  "I click the total expenses navbar link" do
  click_on("Total Expenses")
end

Then  "I see the total balance for the month" do
  page.should have_content("30")
end

Then  "I see the expected balance for the month" do
  page.should have_content("9")
end

Then  "I see the total due for the month for each user" do
  within(".breakdown") do
    page.should have_content("5")
    page.should have_content("10")
    page.should have_content("15")
  end
end

Then  "I see the total balance for the month for each user" do
  within(".breakdown") do
    page.should have_content("3")
    page.should have_content("6")
  end
end
