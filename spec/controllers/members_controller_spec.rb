require 'spec_helper'

describe "GET /my_account" do
  before do
    member1 = Member.create(name: "Bob", ein: "1", role: "User")
    member1.add_payment(5)
    member1.add_due(10)
  end

  it "shows the total expenses due" do
    get_as_user '/my_account'
    expect(last_response.body).to match("5")
  end

  it "shows the total amount paid" do
    get_as_user '/my_account'
    expect(last_response.body).to match("10")
  end

end
