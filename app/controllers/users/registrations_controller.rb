# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :move_to_index, except: [:index, :show]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to :root
    else
      render :new
    end
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
  end

  # DELETE /resource
  def destroy
  end

  private

  def user_params
    params.permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :password_confirmation)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to acion: :index
  #   end
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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    root_path
    #   super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end