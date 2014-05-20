require 'spec_helper'

describe Member do

  it "can say how much has been paid in total by the member" do
    a = Member.create(name: "blah")
    a.payments.create(amount: 5)
    a.payments.create(amount: 2)
    expect(a.total_paid).to eq 7
  end

  it "can work out how much this member owes" do
    a = Member.create
    a.payments.create(amount: 2)
    a.payments.create(amount: 1)
    a.dues.create(amount: 2)
    a.dues.create(amount: 3)
    expect(a.owes).to eq 2
  end

  it "can add a payment" do
    a = Member.create
    old_length = a.payments.length
    a.add_payment(5)
    expect(a.payments.length).to eq old_length + 1
  end

  it "ignores payments of 0" do
    a = Member.create
    old_length = a.payments.length
    a.add_payment(0.0)
    expect(a.payments.length).to eq old_length
  end
end
