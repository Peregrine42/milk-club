class Member < ActiveRecord::Base
  has_many :payments

  def total_paid
    payments.inject(0) { |sum, p| sum += p.amount }
  end

  def owes
    total = DueTotal.most_recent
    total - total_paid
  end

end
