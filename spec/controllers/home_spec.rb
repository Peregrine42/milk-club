require 'spec_helper'

describe App, "/" do

  include_context "rack"

  it "shows the home page" do
    get '/'
    expect(last_response.body).to eq "hello"
  end
end
