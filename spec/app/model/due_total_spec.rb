require 'spec_helper'

describe DueTotal do
  it "can give the most recent total due" do
    DueTotal.create(amount: 4)
    DueTotal.create(amount: 8)

    expect(DueTotal.most_recent).to eq 8
  end

  it "gives back 0 if there are no totals yet" do
    expect(DueTotal.most_recent).to eq 0
  end
end
