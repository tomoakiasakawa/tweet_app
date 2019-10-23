module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    current_user.present?
  end
  
   def redirect_back_or(default)
     redirect_to(session[:forwarding_url] || default)
     session.delete(:forwarding_url)
   end

   def store_location
     session[:forwarding_url] = request.original_url if request.get?
   end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
