module UsersHelper
  def positions_list
    Position.pluck(:name, :id)
  end

  def departments_list
    Department.pluck(:name, :id)
  end
end
