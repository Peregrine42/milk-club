class Member < ActiveRecord::Base
  has_many :payments
  has_many :dues

  def total_paid
    payments.inject(0) { |sum, p| sum += p.amount }
  end

  def total_owed
    dues.inject(0) { |sum, p| sum += p.amount }
  end

  def balance
    total_paid - total_owed
  end

  def class_for_balance
    return "" if balance == 0
    return 'success' if balance > 0
    'danger'
  end

  def add_payment a
    return if a == 0
    payments.create(amount: a)
  end

  def add_due d
    return if d == 0
    dues.create(amount: d)
  end

  def skip_payment
    last_due = dues.last
    return false if last_due.nil?
    last_due.amount = 0
    last_due.save!
    true
  end
end
