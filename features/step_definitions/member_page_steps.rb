When "I click the my account navbar link" do
  click_on("My Account")
end

Then "I see my name, amount due, amount paid and balance" do
  page.should have_content("User User")
  page.should have_content("good ein")
end
