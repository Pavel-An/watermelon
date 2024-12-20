module PermissionsHelper
  def permission_checked?(type, permission) 
    if @permissions.has_key?(type.name)
      @permissions[type.name].include?(permission.name)
    end
  end

  def permission_disabled?(type, permission) 
    if @constraints.has_key?(type.name)
      @constraints[type.name].include?(permission.name)
    end
  end
end
