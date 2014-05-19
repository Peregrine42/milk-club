require 'spec_helper'

describe PaymentUpdate do
  it "adds payments to users given a list of params" do
    params = { "1" => "4" }
    a = double
    Member.stub(:find).and_return a
    a.stub(:add_payment).with("4")

    PaymentUpdate.update params
  end
end
