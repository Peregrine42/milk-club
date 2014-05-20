require 'spec_helper'

describe PaymentUpdate do

  let(:a) { double(:a) }

  before do
    Member.stub(:find).and_return a
  end

  context "user has to pay" do
    it "adds payments to users given a list of params" do
      params = { "1" => {"amount" => "4" } }

      a.should_receive(:add_payment).with(4)
      PaymentUpdate.update params
    end
  end

  context "user skips a payment" do
    it "calls skip payment" do
      params = { "1" => {"amount" => "", "skipped" => "ok" } }

      a.should_receive(:skip_payment)
      PaymentUpdate.update params
    end
  end
end
