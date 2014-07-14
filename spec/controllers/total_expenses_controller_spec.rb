require "spec_helper"

describe "GET /total_expenses" do
  before do
    member1 = Member.create(name: "Bob", ein: "1", role: "Admin")
    member2 = Member.create(name: "James", ein: "2", role: "User")
    member3 = Member.create(name: "Doug", ein: "3", role: "User")
    member1.add_payment(5)
    member2.add_payment(5)
    member3.add_payment(5)
    member1.add_due(5)
    member2.add_due(5)
    member3.add_due(5)
  end

  it "shows the total expenses due" do
    get_as_user '/total_expenses'
    expect(last_response.body).to match("6")
  end

  it "shows the total amount paid" do
    get_as_user '/total_expenses'
    expect(last_response.body).to match("15")
  end

end
