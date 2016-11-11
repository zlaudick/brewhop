module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def brewery_log_in(brewery)
    session[:brewery_id] = brewery.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_brewery
    @current_brewery ||= Brewery.find_by(id: session[:brewery_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def brewery_logged_in?
    !current_brewery.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    session.delete(:brewery_id)
    @current_brewery = nil
  end
end
