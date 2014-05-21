require 'crowd'

class Authenticator
  NotFound      = Class.new(StandardError)
  AlreadyExists = Class.new(StandardError)

  def self.potential_user(attributes)
    crowd         = Crowd.new(App.configuration[:crowd_details])
    user_details  = crowd.find_user(attributes[:ein])

    raise NotFound      unless user_details
    raise AlreadyExists if     Member.find_by(ein: attributes[:ein])

    Member.new_for_confirmation(user_details.merge(:role => attributes[:role]))
  end

  def self.user_with_credentials(credentials)
    crowd         = Crowd.new(App.configuration[:crowd_details])
    user_details  = crowd.authenticate(credentials[:ein], credentials[:password])

    Member.new_for_authenticator(user_details)
  end
end
