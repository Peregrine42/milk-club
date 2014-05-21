module AuthenticationHelper

  def current_user
    @current_user ||= Member.new_from_session(session)
  end

  def current_user_logged_in?
    !session[:name].nil?
  end

  def redirect_unless_logged_in
    return true if URI.parse(url).path == "/login"
    redirect "/login" unless current_user_logged_in?
    true
  end
end
