When "I visit the new member page" do
  visit "/members/new"
end

When "I fill in the new member details" do
  fill_in "name", with: "Some Person"
  fill_in "ein",  with: "12345678"
  select "Admin",  from: "role"
  click_on "add new member"
end

Then "the new member is in the database" do
  expect(Member.exists?(:name => "Some Person")).to eq true
  expect(Member.exists?(:ein  => "12345678")).to   eq true
end


When "I visit the edit page for a member" do
  visit "members/edit/1"
end

When "I change some details" do
  fill_in "name", with: "Some Person"
  fill_in "ein",  with: "12345678"
  select "User",  from: "role"
  click_on "update member"
end

Then "the details in the database will change" do
  member = Member.find(1)
  expect(member.name).to eq "Some Person"
  expect(member.ein).to eq "12345678"
  expect(member.role).to eq "User"
end
