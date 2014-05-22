require "spec_helper"

describe "/" do

  it "shows the users who have not paid" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    bob  = double(:bob,  name: "Bob",  balance: 4, class_for_balance: "")
    fred = double(:fred, name: "Fred", balance: 2, class_for_balance: "")
    Member.stub(:all).and_return([bob, fred])

    get_as_admin '/'
    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

end
