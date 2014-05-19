require "spec_helper"

describe "/" do

  it "shows the users who have not paid" do
    bob  = double
    bob.stub(:name) { "Bob"  }
    bob.stub(:owes) { 4 }

    fred = double
    fred.stub(:name) { "Fred" }
    fred.stub(:owes) { 4 }
    
    report = double(:report, unpaid: [bob, fred])
    MembersReport.stub(:new).and_return(report)

    get '/'
    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

end
