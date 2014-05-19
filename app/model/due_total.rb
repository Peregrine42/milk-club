class DueTotal < ActiveRecord::Base

  def self.most_recent
    all.last.amount
  end

end
