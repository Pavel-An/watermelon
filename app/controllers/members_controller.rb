class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_by_project_id, only: [ :index, :new, :create, :destroy ]
  before_action :find_member, only: [ :update, :destroy ]

  def index
    @members = @project.members
  end

  def new
    @members = User.where.not(id: @project.members.pluck(:user_id).compact)
  end

  def create
    members_params[:user_id].each do |id|
      @members = @project.members.new(user_id: id, invited_id: current_user.id)

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
    @member.update(member_params)

    if @member.save
      flash[:success] = "Member #{@member.name} updated"
    else
      flash.now[:danger] = "Member #{@member.name} not updated"
    end

    redirect_to action: "index"
  end

  def destroy
    if @member.owner? && @project.members.where(role: "owner").count == 1
      flash[:danger] = "You are the sole owner of the project. Add a member with the \"owner\" role"
      redirect_to action: "index"
    else
      @member.destroy
      if @member.destroyed?
        if @member.current_user?(current_user)
          flash[:success] = "You leave project #{@project.name}"
          redirect_to projects_path
        else
          flash[:success] = "Member deleted"
          redirect_to action: "index"
        end
      end
    end
  end

  private

  def members_params
    params.require(:members).permit(user_id: [])
  end

  def member_params
    params.require(:member).permit(:role)
  end

  def find_member
    @member = Member.find(params[:id])
  end

  def find_project_by_project_id
    @project = Project.find(params[:project_id])
  end
end
