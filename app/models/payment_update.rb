class PaymentUpdate

  def self.update payments
    payments.each do |id, details|
        target_member = Member.find(id)
        next if target_member.nil?

        if details.has_key? "skipped"
          target_member.skip_payment
        else
          target_member.add_payment(details["amount"].to_i)
        end
    end
  end

end
