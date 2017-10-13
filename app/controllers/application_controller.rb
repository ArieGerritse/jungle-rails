class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :save_login_state, only: %i[new create]

  protected

  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      true
    else
      redirect_to(controller: 'sessions', action: 'login')
      false
    end
  end

  helper_method :current_user

  def save_login_state
    if session[:user_id]
      redirect_to(controller: 'sessions', action: '/')
      false
    else
      true
    end
  end

  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
