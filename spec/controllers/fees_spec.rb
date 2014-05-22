require "spec_helper"

describe "GET /fees" do
  before do
    Fee.stub(:most_recent).and_return 1
  end

  it "finds the current fee" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    Fee.should_receive(:most_recent)
    get_as_admin '/fees'
  end

  it "shows the fee change page" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    get_as_admin '/fees'
    expect(last_response.body).to match "The current membership fee is"
  end
end

describe "POST /fees" do

  before do
    Fee.stub(:most_recent).and_return 1
    Fee.stub(:create)
  end

  it "finds the current fee" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    Fee.should_receive(:most_recent)
    post_as_admin '/fees', { fee: "2" }
  end

  context "the fee is different" do
    it "adds a new fee" do
      Fee.should_receive(:create).with(amount: 2)
      post_as_admin '/fees', { fee: "2" }
    end

    it "sets the flash and redirects to the fee page" do
      post_as_admin '/fees', { fee: "2" }
      expect(last_response).to redirect_to('/fees')
    end
  end

  context "the fee is the same" do
    it "sets the flash and redirects to the fee page" do
      post_as_admin '/fees', { fee: "1" }
      expect(last_response).to redirect_to('/fees')
    end
  end
end
