class PaymentUpdate

  def self.update payments
    payments.each do |id, value|
        target_member = Member.find(id)
        next if target_member.nil?

        target_member.add_payment(value.to_i)
    end
  end

end
