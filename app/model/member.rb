class Member < ActiveRecord::Base
  has_many :payments
end
