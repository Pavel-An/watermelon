class PermissionsController < ApplicationController
  before_action :find_member

  def edit
    role = MemberRolePermission.find_by(name: @member.role)
    @permissions_role = role.permissions
    @constraints = @permissions_role.merge(role.constraints){ |key, old, new| old.union(new)}
    @permissions = @permissions_role.merge(@member.member_permission.permissions){ |key, old, new| old.union(new)}
  end

  def update
    @member.member_permission.update(permissions: permissions_params)

    redirect_to project_members_path(@member.project)
  
  end

  def find_member
    @member = Member.find(params[:id])
  end

  private

  def permissions_params
    params.require(:permissions).permit(:role, documents: [], members: [], project: [])
  end
end