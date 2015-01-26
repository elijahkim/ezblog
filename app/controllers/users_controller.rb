class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_authorization_check

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path, notice: "Signed up successfully"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    if @user.valid?
      redirect_to root_path, notice: "Email saved successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

