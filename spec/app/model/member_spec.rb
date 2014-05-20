require 'spec_helper'

describe Member do

  let(:member) { Member.create }

  it "can say how much has been paid in total by the member" do
    member.payments.create(amount: 5)
    member.payments.create(amount: 2)
    expect(member.total_paid).to eq 7
  end

  it "can work out how much this member owes" do
    member.payments.create(amount: 2)
    member.payments.create(amount: 1)
    member.dues.create(amount: 2)
    member.dues.create(amount: 3)
    expect(member.balance).to eq(-2)
  end

  it "can skip a payment" do
    member.dues.create(amount: 1)
    member.skip_payment
    expect(member.dues.last.amount).to eq 0
  end

  it "does nothing if there are no dues to skip" do
    expect(member.skip_payment).to eq false
  end

  it "can add a payment" do
    old_length = member.payments.length
    member.add_payment(5)
    expect(member.payments.length).to eq old_length + 1
  end

  it "ignores payments of 0" do
    old_length = member.payments.length
    member.add_payment(0.0)
    expect(member.payments.length).to eq old_length
  end
end
