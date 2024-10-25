class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:success] = "Project create"
      @project.members.create(user_id: current_user.id)
      redirect_to(@project)
    else
      flash.now[:danger] = "Project don\'t create"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end
  
  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:success] = "project has been deleted"
    redirect_to action: :index


  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
