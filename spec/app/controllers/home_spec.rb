require_relative './../../support/rack_context'

describe "/" do

  include_context "rack"

  it "shows the users who have not paid" do
    report = double(:report, names: ["Bob", "Fred"])
    MembersReport.stub(:new).and_return(report)
    get '/'
    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

end
