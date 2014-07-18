Given 'I am logged in' do
  login_as('User')
end

Given 'I am logged in as an administrator' do
  login_as('Admin')
end

Given "I am on the login page" do
  visit "/login"
  page.should have_content "EIN"
end

When "I log in with valid iuser credentials" do

  Member.create(:ein => 'good ein', :role => 'Admin', :name => 'Valid User')
  crowd_double.stub_login(:uin        => 'good ein',
                          :password   => 'good password',
                          :first_name => 'Valid',
                          :last_name  => 'User')

  fill_in('EIN',      :with => 'good ein')
  fill_in('Password', :with => 'good password')

  click_button "Login"
end

When "I attempt to log in with invalid credentials" do
  crowd_double.stub_login_fail( :uin        => 'bad ein',
                                :password   => 'bad password')

  fill_in 'EIN',      :with => 'bad ein'
  fill_in 'Password', :with => 'bad password'

  click_on 'Login'
end

When 'I attempt to log in with valid credentials but the user is not in the database' do
  crowd_double.stub_login(:uin        => 'good ein',
                          :password   => 'good password',
                          :first_name => 'Valid',
                          :last_name  => 'Deity')

  fill_in 'ein',      :with => 'good ein'
  fill_in 'password', :with => 'good password'

  click_on 'Login'
end

When 'I log in as an admin' do
  Member.create(name: 'blah', :ein => 'good ein', :role => 'Admin')

  crowd_double.stub_login(:uin        => 'good ein',
                          :password   => 'good password',
                          :first_name => 'Valid',
                          :last_name  => 'Admin')

  fill_in 'ein',      :with => 'good ein'
  fill_in 'password', :with => 'good password'

  click_on 'Login'
end

When 'I log out' do
  click_link 'Logout'
end

Then "I should see my name in the page header" do
  page.should have_content "Valid User"
  page.should have_content "Admin"
end

Then "I should still be on the login page" do
  page.body.should have_content('EIN')
  page.body.should have_content('Password')
end

Then "I should see that my credentials were invalid" do
  page.body.should have_content('invalid')
end

Then 'I should see that I do not have permission to log in' do
  page.body.should have_content('permission')
end

Then 'I should see that I am an admin' do
  page.body.should have_content(' - Admin')
end

Then 'I should be on the login page' do
  page.body.should have_content('EIN')
  page.body.should have_content('Password')
end
