require 'spec_helper'

describe PaymentUpdate do
  it "adds payments to users given a list of params" do
    params = { "1" => {"amount" => "4" } }
    a = double
    Member.stub(:find).and_return a
    a.stub(:add_payment).with(4)

    PaymentUpdate.update params
  end

  it "adds a negative amount due if the skipped field is filled" do
    params = { "1" => {"amount" => "", "skipped" => "ok" } }
    Fee.stub(:most_recent).and_return 1
    a = double
    a.stub(:add_due).with(-1)
    Member.stub(:find).and_return a

    PaymentUpdate.update params
  end
end
