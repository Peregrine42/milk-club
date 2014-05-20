class MembersReport

  def unpaid
    Member.all.select { |m| m.owes > 0 }
  end

end
