require 'spec_helper'

describe "GET /members" do

  it "shows the user balance" do
    get_as_user '/members'
    expect(last_response.body).to match("User User")
    expect(last_response.body).to match("Balance: £3")
  end
end
