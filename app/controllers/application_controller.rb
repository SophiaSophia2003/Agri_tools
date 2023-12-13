class ApplicationController < ActionController::Base
  helper_method :current_cart
  # before_action :authenticate_customer!
  layout :set_layout
  before_action :log_session_id
  # before_action :check_session_expiry



  private

  def log_session_id
    Rails.logger.debug "Session ID: #{session.id}"
  end

  def set_layout
    # Assume current_user.admin? is a method indicating whether the user is an admin
    # current_user.admin? ? 'admin' : 'customer'
  end

  def authenticate_administrator!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_administrator
  end

  def current_cart
    @current_cart ||= find_or_create_cart
  end

  def find_or_create_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = current_customer&.cart || Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

  def check_session_expiry
    if current_user && session[:last_seen] && session[:last_seen] < 30.minutes.ago
      sign_out current_user
      reset_session
      redirect_to new_user_session_path, notice: 'Your session has timed out. Please sign in again.'
    else
      session[:last_seen] = Time.now
    end
  end  
end


