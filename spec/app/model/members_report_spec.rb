require_relative "../../../app"

describe MembersReport do

  it "has the names of users who haven't paid this month" do
    a = double(:a)
    a.stub(:total_paid) { 4 }
    
    b = double(:b)
    b.stub(:total_paid) { 4 }
    
    c = double(:c)
    c.stub(:total_paid) { 5 }

    DueTotal.stub(:most_recent).and_return 5
    Member.stub(:all).and_return [a, b, c]

    expect(MembersReport.new.unpaid).to eq [a, b]
  end

end
