require_relative "../../../app"

describe Member do

  it "can say how much has been paid in total by the member" do
    a = Member.new(name: "blah")
    a.payments.new(amount: 5)
    a.payments.new(amount: 2)
    expect(a.total_paid).to eq 7
  end

end
