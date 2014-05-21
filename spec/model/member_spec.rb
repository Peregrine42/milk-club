require 'spec_helper'

describe Member do

  let(:member) { Member.create(ein: '1234', role: 'User') }

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

describe Member, "#class_for_balance" do
  let(:member) { Member.create(ein: '1234', role: 'User') }

  it "returns 'success' if the balance is positive" do
    member.payments.create(amount: 2)
    expect(member.class_for_balance).to eq('success')
  end

  it "returns 'danger' if the balance is negative" do
    member.dues.create(amount: 2)
    expect(member.class_for_balance).to eq('danger')
  end

  it "returns an empty string if the balance is zero" do
    expect(member.class_for_balance).to eq('')
  end
end

describe "validations" do

  before do
    Member.destroy_all
  end

  it "does not allow empty eins" do
    lambda { Member.create!(ein: "", role: "Admin")}.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "does not allow duplicate eins" do
    Member.create!(ein: "123", role: "Admin")
    lambda { Member.create!(ein: "123", role: "Admin")}.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "only allows Admin or User" do
    lambda { Member.create!(ein: "234", role: "Minion") }.should raise_error(ActiveRecord::RecordInvalid)
    Member.create!(ein: "234", role: "Admin").should be_true
    Member.create!(ein: "345", role: "User").should be_true
  end
end

describe Member, 'default scope' do

  before do
    Member.destroy_all
  end

  it 'returns the users in name order' do
    user_1 = Member.create!(name: 'c', ein: '2345', role: 'Admin')
    user_2 = Member.create!(name: 'b', ein: '3456', role: 'User')
    user_3 = Member.create!(name: 'a', ein: '1234', role: 'User')
    Member.all.should == [user_3, user_2, user_1]
  end
end

describe Member, '.new_for_authenticator' do
  it 'returns a user whose name is set by the attributes' do
    Member.create(ein: '1234', role: 'User')
    user = Member.new_for_authenticator(:ein => '1234', :name => 'a name')
    user.name.should == 'a name'
  end

  it 'raises an exception if the user is not in the database' do
    Member.destroy_all
    lambda { Member.new_for_authenticator(:ein => '1234', :name => 'a name')}.should raise_error(ActiveRecord::RecordNotFound)
  end
end

describe Member, '.new_from_session' do
  it 'sets the name from the attributes' do
    user = Member.new_from_session(:name => "A Name")
    user.name.should == "A Name"
  end

  it 'sets the role from the attributes' do
    user = Member.new_from_session(:role => "A role")
    user.role.should == "A role"
  end
end
