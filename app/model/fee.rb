class Fee < ActiveRecord::Base
  def self.most_recent
    last_item = all.last
    return 0 unless last_item
    return last_item.amount
  end
end
