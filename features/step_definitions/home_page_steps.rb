Given "there are members in the database" do
  Member.create("Richard")
  Member.create("Duncan")
  Member.create("Joe")
end

When "I visit the home page" do
  visit "/"
end

Then "I see the members who haven't paid" do
  expect(page).to have_content("Richard")
  expect(page).to have_content("Duncan")
  expect(page).to have_content("Joe")
end
