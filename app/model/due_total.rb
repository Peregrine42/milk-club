class DueTotal < ActiveRecord::Base

  def self.most_recent
    last = all.last
    return 0 unless last
    return last.amount
  end

end
