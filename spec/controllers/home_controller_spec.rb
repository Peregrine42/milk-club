require "spec_helper"

describe "GET /" do

  it "shows the users who have not paid" do
    Member.stub(:find_for_session).and_return(double(:dummy_member, name: 'An Admin', role: 'Admin'))
    bob  = double(:bob,  name: "Bob",  balance: 4, class_for_balance: "")
    fred = double(:fred, name: "Fred", balance: 2, class_for_balance: "")
    Member.stub(:all).and_return([bob, fred])

    get_as_admin '/'
    expect(last_response.body).to match "Bob"
    expect(last_response.body).to match "Fred"
  end

end

describe "GET /my_account" do

  it "shows the user balance" do
    Timecop.freeze do
      member = Member.create(name: "A User", ein: "1", role: "User")
      Payment.create(member_id: member.id, amount: 3.01, created_at: 2.days.ago)
      Payment.create(member_id: member.id, amount: 1.01, created_at: 1.day.ago)
      Due.create(member_id: member.id, amount: 2.01, created_at: 5.days.ago)
      Due.create(member_id: member.id, amount: 1.01, created_at: 1.day.ago)

      get_as_user '/my_account'
      expect(last_response.body).to match("A User")
      expect(last_response.body).to match("Balance: £1")
    end
  end
end
