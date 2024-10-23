class ProjectsController < ApplicationController
  before_action :authenticate_user!
  # user_signed_in?


  def index 
    @projects = current_user.projects
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end
  
  def update
  end

  def destroy
  end
end
