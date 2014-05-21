require "spec_helper"

describe "/payments" do

  it "shows all the users" do
    bob  = double
    bob.stub(:id)   { "1" }
    bob.stub(:name) { "Bob"  }
    bob.stub(:owes) { 4 }

    fred = double
    fred.stub(:id)   { "2" }
    fred.stub(:name) { "Fred" }
    fred.stub(:owes) { 4 }

    Member.stub(:all).and_return([bob, fred])

    get_as_admin '/payments'

    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

  it "adds payments to those users with a non-zero value against their name" do
    params = { "payment" => "blah" }

    PaymentUpdate.should_receive(:update).with("blah")
    post_as_admin '/payments', params
  end

end
