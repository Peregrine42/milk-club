require 'spec_helper'

describe MembersReport do

  it "finds the names of users who haven't paid this month" do
    a = double(:a)
    a.stub(:owes) { 1 }
    
    b = double(:b)
    b.stub(:owes) { 2 }
    
    c = double(:c)
    c.stub(:owes) { 0 }

    Member.stub(:all).and_return [a, b, c]

    expect(subject.unpaid).to eq [a, b]
  end

end
