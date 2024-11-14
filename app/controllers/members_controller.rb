class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project

  def index
    @members = @project.members
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
