module SessionsHelper

private 
$a = Array.new

#these are sign in of user --
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    online_user user
    current_user = user
  end 
  
  def current_user=(user)
    @current_user = user
  end


  def current_user
    @current_user ||= user_from_remember_token
  end

  def user_from_remember_token
    remember_token = cookies[:remember_token]  
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def signed_in?
    !current_user.nil?
  end 

  def current_user?(user)
    user == current_user
  end

  def sign_out
    offline_user (current_user)
    cookies.delete(:remember_token)
    current_user= nil
  end

  # these are for friendly redirecting --

  def return_to_back(default)
    redirect_to (session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath 
  end

  def clear_return_to
    session.delete(:return_to)
  end

  # these are for making user online 
  def online_user (user)
    $a.append(user.email)
  end

  def offline_user (user)
    $a.delete(user.email)
  end
end
