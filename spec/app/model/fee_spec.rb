require 'spec_helper'

describe Fee do
  it "can give the most recent monthly fee" do
    Fee.create(amount: 4)
    Fee.create(amount: 8)

    expect(Fee.most_recent).to eq 8
  end

  it "gives back 0 if there are no fees yet" do
    expect(Fee.most_recent).to eq 0
  end
end
