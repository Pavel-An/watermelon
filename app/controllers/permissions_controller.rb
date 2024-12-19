class PermissionsController < ApplicationController
  before_action :find_member

  def edit
    @permissions = @member.permissions
  end

  def update
  end

  def find_member
    @member = Member.find(params[:id])
  end
end
