module UsersHelper
  def posts_list
    arr = [["no data", nil]]

    Post.all.each do |post|
      arr << [post.name, post.id]
    end
    arr
  end

  def departments_list
    arr = [["no data", nil]]

    Department.all.each do |department|
      arr << [department.name, department.id]
    end
    arr
  end
end
