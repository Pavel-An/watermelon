class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update ]

  def show
  end

  def edit
    @user.build_user_position if @user.user_position.blank?
    @user.build_user_department if @user.user_department.blank?
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
    params.require(:user).permit(
                                 :email, 
                                 :password, 
                                 :firstname, 
                                 :lastname, 
                                 :middlename, 
                                 :avatar, 
                                 user_position_attributes:[:position_id, :id, :_destroy], 
                                 user_department_attributes:[:department_id, :id, :_destroy]
                                )
  end
end
