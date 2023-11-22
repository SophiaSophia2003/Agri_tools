class ApplicationController < ActionController::Base
  layout :set_layout

  private

  def set_layout
    # Assume current_user.admin? is a method indicating whether the user is an admin
    # current_user.admin? ? 'admin' : 'customer'
  end
end
