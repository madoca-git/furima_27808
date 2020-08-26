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
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @name = @user.build_name
    render :new_name
  end

  def create_name
    @user = User.new(session['devise.regist_data']['user'])
    @name = Name.new(name_params)
    render :new_name and return unless @name.valid?

    @user.build_name(@name.attributes)
    @user.save
    session['devise.regist_data']['user'].clear
    sign_in @user
    redirect_to :root
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :password_confirmation)
  end

  protected

  def after_sign_up_path_for(_resource)
    root_path
  end

  def name_params
    params.require(:name).permit(:birthday)
  end
end
