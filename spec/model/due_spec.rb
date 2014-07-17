require 'spec_helper'

describe Due, ".for_members" do
  it "create a new due for each member" do
    member1 = double(:member1, id: 3, multiplier: 1.0)
    member2 = double(:member2, id: 4, multiplier: 0.5)
    member3 = double(:member3, id: 5, multiplier: 2.0)

    Due.for_members(5, [member1, member2, member3])

    expect(Due.all.count).to eq 3
  end
end
