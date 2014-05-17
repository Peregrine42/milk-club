When "I visit the home page" do
  visit "/"
end

Then "the home page is displayed" do
  expect(page).to have_content('hello')
end
