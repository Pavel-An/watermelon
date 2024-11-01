module UsersHelper
  def positions_list
    Position.pluck(:name, :id)
  end

  def departments_list
    arr = Department.pluck(:name, :id)
    # arr << ["", nil]
    arr
  end

  def user_department(user)
    if user.department.blank?
      nil
    else
      user.department.id
    end
  end

  def user_position(user)
    if user.position.blank?
      nil
    else
      user.position.id
    end
  end
end
