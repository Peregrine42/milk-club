require 'spec_helper'

describe Member do

  it "can say how much has been paid in total by the member" do
    a = Member.new(name: "blah")
    a.payments.new(amount: 5)
    a.payments.new(amount: 2)
    expect(a.total_paid).to eq 7
  end

  it "can work out how much this member owes" do
    a = Member.new
    a.payments.new(amount: 5)
    DueTotal.stub(:most_recent).and_return(6)
    expect(a.owes).to eq 1
  end

  it "can add a payment" do
    a = Member.new
    old_length = a.payments.length
    a.add_payment(5)
    expect(a.payments.length).to eq old_length + 1
  end

  it "ignores payments of 0" do
    a = Member.new
    old_length = a.payments.length
    a.add_payment(0.0)
    expect(a.payments.length).to eq old_length
  end
end
