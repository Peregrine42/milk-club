require "spec_helper"

describe "GET /new_amount_due" do

  it "shows a button to add a new amount due" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    get_as_admin '/new_amount_due'

    expect(last_response.body).to match "Add new amount due"
  end
end

describe 'POST /new_amount_due' do

  it "adds a new amount due to every user" do
    Fee.stub(:most_recent).and_return(:amount)
    Member.stub(:all).and_return(:members)
    Due.should_receive(:for_members).with(:amount, :members)
    post_as_admin '/new_amount_due'
  end

end
