require "spec_helper"

describe "GET /fees" do
  before do
    Fee.stub(:most_recent).and_return 1
  end

  it "finds the current fee" do
    Fee.should_receive(:most_recent)
    get '/fees'
  end

  it "shows the fee change page" do
    get '/fees'
    expect(last_response.body).to match "The current membership fee is"
  end
end

describe "POST /fees" do

  before do
    Fee.stub(:most_recent).and_return 1
    Fee.stub(:create)
  end

  it "finds the current fee" do
    Fee.should_receive(:most_recent)
    post '/fees', { fee: "2" }
  end

  context "the fee is different" do
    it "adds a new fee" do
      Fee.should_receive(:create).with(amount: 2)
      post '/fees', { fee: "2" }
    end

    it "sets the flash and redirects to the fee page" do
      post '/fees', { fee: "2" }
      follow_redirect!
      expect(last_response.body).to match "The fee has been updated"
      expect(last_response.body).to match "The current membership fee is"
    end
  end

  context "the fee is the same" do
    it "sets the flash and redirects to the fee page" do
      post '/fees', { fee: "1" }
      follow_redirect!
      expect(last_response.body).to match "The fee has not been changed"
      expect(last_response.body).to match "The current membership fee is"
    end
  end
end
