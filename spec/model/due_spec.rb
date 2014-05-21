require 'spec_helper'

describe Due, ".for_members" do
  it "create a new due for each member" do
    member1 = double(:member1, id: 3)
    member2 = double(:member2, id: 4)
    member3 = double(:member3, id: 5)

    Due.for_members(4, [member1, member2, member3])

    expect(Due.all.count).to eq 3
  end
end
