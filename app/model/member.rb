class Member < ActiveRecord::Base
  has_many :payments
  has_many :dues

  def total_paid
    payments.inject(0) { |sum, p| sum += p.amount }
  end

  def total_owed
    dues.inject(0) { |sum, p| sum += p.amount }
  end

  def owes
    total_owed - total_paid
  end

  def add_payment a
    return if a == 0
    payments.create(amount: a)
  end

  def add_due d
    return if d == 0
    dues.create(amount: d)
  end
end
