class MembersReport

  def unpaid
    total = DueTotal.most_recent
    Member.all.select { |m| m.total_paid < total }
  end

end
