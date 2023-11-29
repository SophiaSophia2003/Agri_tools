class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :authenticate_customer!
  layout :set_layout
  before_action :log_session_id



  private

  def log_session_id
    Rails.logger.debug "Session ID: #{session.id}"
  end

  def set_layout
    # Assume current_user.admin? is a method indicating whether the user is an admin
    # current_user.admin? ? 'admin' : 'customer'
  end


  def current_cart
    byebug
    @current_cart ||= Cart.find_or_create_by(id: session[:cart_id] || params[:id])
    session[:cart_id] = @current_cart.id
    @current_cart
  end  
end
