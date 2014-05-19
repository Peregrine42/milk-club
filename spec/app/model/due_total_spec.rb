require_relative "../../../app"

describe DueTotal do
  it "can give the most recent total due" do
    DueTotal.create(amount: 4)
    DueTotal.create(amount: 8)

    expect(DueTotal.most_recent).to eq 8
  end
end
