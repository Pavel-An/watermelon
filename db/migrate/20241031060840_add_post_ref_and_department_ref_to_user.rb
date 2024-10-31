class AddPostRefAndDepartmentRefToUser < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :post, foreign_key: true
    add_reference :users, :department, foreign_key: true
  end
end
