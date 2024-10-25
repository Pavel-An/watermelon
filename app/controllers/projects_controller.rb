class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:success] = "Project created"
      @project.members.create(user_id: current_user.id)
      redirect_to @project
    else
      flash.now[:danger] = "Project don\'t created"
      render :new, status: :unprocessable_entity
    end
  end

  def show
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
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
