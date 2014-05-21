module LoginHelpers

  def crowd_double
    @crowd_double ||= CrowdDouble.new(App.configuration[:crowd_details])
  end

  def login_as(role)
    Member.create(:ein => 'good ein', :role => role, name: "#{role} User")

    visit('/login')
    crowd_double.stub_login(:uin        => 'good ein',
                            :password   => 'good password',
                            :first_name => role,
                            :last_name  => 'User')

    fill_in 'ein',      :with => 'good ein'
    fill_in 'password', :with => 'good password'

    click_on 'Login'
  end
end

World(LoginHelpers)
