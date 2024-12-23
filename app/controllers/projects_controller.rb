class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_dy_id, only: [ :show, :edit, :update, :destroy ]
  load_and_authorize_resource

  def index
    if current_user.admin?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:success] = "Project created"
      member = @project.members.create(user_id: current_user.id, role: "owner", invited_id: current_user.id )
      if member.created_at?
        member.create_member_permission(permissions: {role: "role: #{member.role}"})
      end
      redirect_to @project
    else
      flash.now[:danger] = "Project don\'t created"
      render :new, status: :unprocessable_entity
    end
  end

  def show   
    if @project.member?(current_user)
      member = @project.member(current_user)
      member.update(last_activity: Time.now)
      member.save
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      flash.now[:danger] = "Project don\'t updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    flash[:success] = "project has been deleted"
    redirect_to action: :index
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end

  def find_project_dy_id
    @project = Project.find(params[:id])
  end
end
