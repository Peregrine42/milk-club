require 'spec_helper'

describe "GET /members" do

  xit "shows the user balance" do
    Timecop.freeze do
      member = Member.create(name: "A User", ein: "12345", role: "User")
      Payment.create(member_id: member.id, amount: 3.01, created_at: 2.days.ago)
      Payment.create(member_id: member.id, amount: 1.01, created_at: 1.day.ago)
      Due.create(member_id: member.id, amount: 2.01, created_at: 5.days.ago)
      Due.create(member_id: member.id, amount: 1.01, created_at: 1.day.ago)

      get_as_user '/members'
      expect(last_response.body).to match("A User")
      expect(last_response.body).to match("Balance: £1")
    end
  end
end
