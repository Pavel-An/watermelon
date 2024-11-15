class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_by_id, only: [:index, :new, :create,:destroy]
  before_action :find_member, only: [:destroy]

  def index
    @members = @project.members
  end

  def new
    @members = User.where.not(id: @project.members.pluck(:user_id).compact)
  end

  def create
    members_params[:user_id].each do |id|
      @members = @project.members.create(user_id: id)
    end

    redirect_to action: "index"
  end

  def edit
    
  end

  def update
  end

  def destroy
    @member.destroy if @project.members.count > 1
    redirect_to action: "index"
  end

  private

  def members_params
    params.require(:members).permit(user_id:[]) 
  end

  private

  def find_member
    @member = Member.find(params[:id])
  end 
end
