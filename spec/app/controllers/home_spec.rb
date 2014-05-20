require "spec_helper"

describe "/" do

  it "shows the users who have not paid" do
    bob  = double(:bob,  name: "Bob",  balance: 4, class_for_balance: "")
    fred = double(:fred, name: "Fred", balance: 2, class_for_balance: "")
    Member.stub(:all).and_return([bob, fred])

    get '/'
    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

end
