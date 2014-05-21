class Due < ActiveRecord::Base
  belongs_to :member

  def self.for_members amount, members
    members.each do |member|
      Due.create!(amount: amount, member_id: member.id)
    end
  end
end
