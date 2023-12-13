# frozen_string_literal: true

class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
    before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:phone_number,:province_id])
    # Add other attributes you want to permit during sign-up
  end

  def after_sign_up_path_for(resource)
    # Redirect to the product page after sign up
    products_path(resource)
  end



  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:province_id, :other_attributes])
  end

  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
    self.resource.province_id = hash[:province_id]
    self.resource
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
