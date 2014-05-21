class Member < ActiveRecord::Base
  has_many :payments
  has_many :dues

  validates :ein,   presence:   true,
                    uniqueness: true
  validates :role,  inclusion: {in: %w(Admin User)}

  scope :ordered, ->{ order("name asc") }

  def self.default_scope
    ordered
  end

  def self.new_for_authenticator(attributes)
    user = Member.where(:ein => attributes[:ein]).first
    raise ActiveRecord::RecordNotFound unless user

    user.name = attributes[:name]
    user
  end

  def self.new_from_session(attributes)
    user = Member.new
    user.name = attributes[:name]
    user.role = attributes[:role]
    user
  end

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


  #def admin?
    #(role != "User")
  #end

  #def user_admin?
    #(role == "Deity")
  #end

  #def initials
    #initials = ""
    #name.split.each do |part|
      #initials.concat(part[0])
    #end
    #initials.upcase
  #end

end
