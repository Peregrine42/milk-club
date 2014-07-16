When "I click the multiplier navbar link" do
  click_on("Multiplier")
end

Then "I should see the multipliers for each user" do
  expect(find(".duncan_multiplier").value).to eq("1.0")
end

Then "I am able to edit each users' multiplier" do
  fill_in "duncan_multiplier", with: 0.5
  click_on "Change Duncan's multiplier"
end

Then "the new multiplier will be saved" do
  member = Member.where(name: "Duncan").first
  expect(member.multiplier).to eq 0.5
 # expect(page).to have_content("The fee has been updated")
end
