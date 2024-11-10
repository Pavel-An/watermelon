class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update ]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :firstname, :lastname, :middlename, :avatar)
  end
end
