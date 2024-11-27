class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_by_project_id, only: [ :index, :new, :create,:destroy ] 
  before_action :find_member, only: [:destroy ]

  def index
    @members = @project.members
  end

  def new
    @members = User.where.not(id: @project.members.pluck(:user_id).compact)
  end

  def create
    members_params[:user_id].each do |id|
      @members = @project.members.new(user_id: id)

      if @members.save
        flash[:success] = "Member(s) added"
      else
        flash.now[:danger] = "Member(s) not added"
      end
    end

    redirect_to action: "index"
  end

  def edit
    
  end

  def update
  end

  def destroy
    @member.destroy if @project.members.count > 1
    flash[:success] = "Member deleted"
    redirect_to action: "index"
  end

  private

  def members_params
    params.require(:members).permit(user_id:[]) 
  end

  def find_member
    @member = Member.find(params[:id])
  end 


  def find_project_by_project_id
    @project = Project.find(params[:project_id])
  end
end
